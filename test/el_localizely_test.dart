import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:easiest_remote_localization/src/model/cdn_source.dart';
import 'package:easiest_remote_localization/src/provider/cdn_localization_provider.dart';
import 'package:easiest_remote_localization/src/tools/types.dart';
import 'package:flutter_test/flutter_test.dart';

const Locale en = Locale('en');

void main() {
  test(
    'CND Localization Provider test',
    () async {
      final CDNLocalizationProvider provider = CDNLocalizationProvider<Json>(
        options: BaseOptions(baseUrl: 'https://indieloper.b-cdn.net'),
        factory: (CDNSource source, Json content) => content,
        sources: const [
          CDNSource(
            locale: en,
            path: '/en.yaml',
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
