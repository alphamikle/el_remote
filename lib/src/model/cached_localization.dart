import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

import '../tools/types.dart';

part 'cached_localization.g.dart';

@JsonSerializable()
class CachedLocalization {
  const CachedLocalization({
    required this.locale,
    required this.messages,
    required this.refreshAt,
  });

  factory CachedLocalization.fromJson(dynamic json) => _$CachedLocalizationFromJson(castToJson(json));

  @JsonKey(fromJson: localeFromJson, toJson: localeToJson)
  final Locale locale;

  final Json messages;

  final DateTime refreshAt;

  bool get needToUpdate => messages.isEmpty || DateTime.now().isAfter(refreshAt);

  bool get canBeUsed => messages.isNotEmpty && needToUpdate == false;

  Json toJson() => _$CachedLocalizationToJson(this);
}
