import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:easiest_localization/easiest_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/cached_localization.dart';
import '../model/cdn_source.dart';
import '../service/cdn_service.dart';
import '../tools/extensions.dart';
import '../tools/types.dart';

String _cacheKey(Locale locale) => '3AAABA2E-45EF-4EDB-B8BE-BEC9DA258A7C | CND LOCALIZATION PROVIDER CACHE ($locale) | 0E555CAC-F6DE-4EFB-BB9C-13C441CCFF52';

typedef LocalizationMessagesFactory<Messages> = FutureOr<Messages> Function(CDNSource source, Json content);

class CDNLocalizationProvider<Messages> implements LocalizationProvider<Messages> {
  CDNLocalizationProvider({
    required List<CDNSource> sources,
    required LocalizationMessagesFactory<Messages> factory,
    String? name,
    BaseOptions? options,
    Duration? cacheTTL,
  })  : _cacheTTL = cacheTTL,
        _factory = factory,
        _name = name,
        _sources = sources {
    final Dio dio = Dio(options);
    _cdnService = CDNService(dio);
    supportedLocales = sources.map((CDNSource source) => source.locale).toList(growable: false);
  }

  CDNLocalizationProvider.raw({
    required CDNService cdnService,
    required List<CDNSource> sources,
    required LocalizationMessagesFactory<Messages> factory,
    required this.supportedLocales,
    required SharedPreferences sharedPreferences,
    String? name,
    Duration? cacheTTL,
  })  : _sharedPreferences = sharedPreferences,
        _cdnService = cdnService,
        _sources = sources,
        _name = name,
        _factory = factory,
        _cacheTTL = cacheTTL,
        _sharedPreferencesInitialized = true;

  late final CDNService _cdnService;
  final List<CDNSource> _sources;
  final String? _name;
  final LocalizationMessagesFactory<Messages> _factory;
  final Duration? _cacheTTL;
  late final SharedPreferences _sharedPreferences;

  @override
  late final List<Locale> supportedLocales;

  final Map<Locale, CachedLocalization> _cache = {};

  bool _sharedPreferencesInitialized = false;

  @override
  String get name => _name ?? 'CDNLocalizationProvider';

  @override
  bool canLoad(Locale locale) => _sources.any((CDNSource it) => it.locale == locale);

  @override
  Future<Messages> fetchLocalization(Locale locale) async {
    final String cacheKey = _cacheKey(locale);

    if (_sharedPreferencesInitialized == false) {
      _sharedPreferences = await SharedPreferences.getInstance();
      _sharedPreferencesInitialized = true;
    }

    final CDNSource? source = _sources.firstWhereOrNull((CDNSource source) => source.locale == locale);

    if (source == null) {
      throw Exception('Locale $locale is not supported');
    }

    CachedLocalization? cachedValue = _cache[locale];

    if (cachedValue == null && _sharedPreferences.containsKey(cacheKey)) {
      final String? diskCache = _sharedPreferences.getString(cacheKey);
      if (diskCache != null) {
        try {
          final DJson parsedCache = jsonDecode(diskCache);
          cachedValue = CachedLocalization.fromJson(parsedCache);
          _cache[locale] = cachedValue;
        } catch (error) {
          await _sharedPreferences.remove(cacheKey);
        }
      }
    }

    if (cachedValue != null && cachedValue.canBeUsed) {
      return await _factory(source, cachedValue.messages);
    }

    Json? response;

    try {
      response = await _cdnService.downloadFile(source);
      final CachedLocalization cache = CachedLocalization(
        locale: locale,
        messages: response,
        refreshAt: DateTime.now().add(_cacheTTL ?? const Duration(hours: 3)),
      );
      _cache[locale] = cache;
      await _sharedPreferences.setString(cacheKey, jsonEncode(cache.toJson()));
    } catch (error, stackTrace) {
      log('Error on load CDN Localization content', error: error, stackTrace: stackTrace, name: 'CDN PROVIDER');
    }

    response ??= cachedValue?.messages;

    if (response == null) {
      throw Exception('Failed to load localization content for the locale $locale');
    }

    try {
      final Messages messages = await _factory(source, response);
      return messages;
    } catch (error, stackTrace) {
      log('Error on parsing remote localization source', error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
