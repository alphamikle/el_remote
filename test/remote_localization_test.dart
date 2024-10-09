import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:easiest_remote_localization/src/model/remote_source.dart';
import 'package:easiest_remote_localization/src/provider/remote_localization_provider.dart';
import 'package:easiest_remote_localization/src/tools/types.dart';
import 'package:flutter_test/flutter_test.dart';

const Locale en = Locale('en');

void main() {
  test(
    'Remote Localization Test',
    () async {
      final RemoteLocalizationProvider provider = RemoteLocalizationProvider<Json>(
        options: BaseOptions(baseUrl: 'https://indieloper.b-cdn.net'),
        factory: (RemoteSource source, Json content) => content,
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
