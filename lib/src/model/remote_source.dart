import 'dart:ui';

enum SourceType {
  json,
  yaml,
}

class RemoteSource {
  const RemoteSource({
    required this.locale,
    required this.url,
    required this.type,
  });

  final Locale locale;

  final String url;

  final SourceType type;

  @override
  String toString() {
    return 'RemoteSource{locale: $locale, url: $url, type: $type}';
  }
}
