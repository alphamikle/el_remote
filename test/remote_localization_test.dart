import 'package:dio/dio.dart';
import 'package:easiest_remote_localization/easiest_remote_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Locale en = Locale('en');

class _SharedPreferences implements SharedPreferences {
  @override
  Future<bool> clear() async => true;

  @override
  Future<bool> commit() async => true;

  @override
  bool containsKey(String key) => false;

  @override
  Object? get(String key) => null;

  @override
  bool? getBool(String key) => null;

  @override
  double? getDouble(String key) => null;

  @override
  int? getInt(String key) => null;

  @override
  Set<String> getKeys() => {};

  @override
  String? getString(String key) => null;

  @override
  List<String>? getStringList(String key) => null;

  @override
  Future<void> reload() async {}

  @override
  Future<bool> remove(String key) async => true;

  @override
  Future<bool> setBool(String key, bool value) async => true;

  @override
  Future<bool> setDouble(String key, double value) async => true;

  @override
  Future<bool> setInt(String key, int value) async => true;

  @override
  Future<bool> setString(String key, String value) async => true;

  @override
  Future<bool> setStringList(String key, List<String> value) async => true;
}

void main() {
  test(
    'Remote Localization Test',
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final RemoteLocalizationProvider provider =
          RemoteLocalizationProvider<Json>.raw(
        supportedLocales: [
          Locale('en'),
        ],
        sharedPreferences: _SharedPreferences(),
        service: RemoteLocalizationService(
          Dio(
            BaseOptions(baseUrl: 'https://indieloper.b-cdn.net'),
          ),
        ),
        factory: (RemoteSource source, Json content) => content,
        cacheTTL: Duration.zero,
        sources: const [
          RemoteSource(
            locale: en,
            url: '/en.yaml',
            type: SourceType.yaml,
          ),
        ],
      );

      expect(provider.canLoad(en), true);

      final Json messages = await provider.fetchLocalization(en);

      expect(messages.length, greaterThan(0));
    },
  );
}
