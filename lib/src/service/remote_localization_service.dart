import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:yaml/yaml.dart';

import '../model/remote_source.dart';
import '../tools/types.dart';

class RemoteLocalizationService {
  const RemoteLocalizationService(this.dio);

  final Dio dio;

  Future<Json> fetchLocalization(RemoteSource source) async {
    try {
      final Response<dynamic> response = await dio.get(
        source.url,
      );
      final dynamic data = response.data;
      if (data is String) {
        final dynamic parsedData = switch (source.type) {
          SourceType.yaml => loadYaml(data),
          SourceType.json => jsonDecode(data),
        };
        return castToJson(parsedData);
      } else if (data is Map) {
        return data is Json ? data : castToJson(data);
      }
      log('The response of the RemoteLocalizationService should be a type of String. Actual response is:\n$data', name: 'RemoteLocalizationService');
      return {};
    } catch (error, stackTrace) {
      log('Error on load localization with source $source', error: error, stackTrace: stackTrace, name: 'RemoteLocalizationService');
    }
    return <String, dynamic>{};
  }
}
