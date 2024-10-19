// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_localization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CachedLocalization _$CachedLocalizationFromJson(Map<String, dynamic> json) =>
    CachedLocalization(
      locale: localeFromJson(json['locale']),
      messages: json['messages'] as Map<String, dynamic>,
      refreshAt: DateTime.parse(json['refreshAt'] as String),
    );

Map<String, dynamic> _$CachedLocalizationToJson(CachedLocalization instance) =>
    <String, dynamic>{
      'locale': localeToJson(instance.locale),
      'messages': instance.messages,
      'refreshAt': instance.refreshAt.toIso8601String(),
    };
