import 'dart:ui';

enum SourceType {
  json,
  yaml,
}

class CDNSource {
  const CDNSource({
    required this.locale,
    required this.path,
    required this.type,
  });

  final Locale locale;

  final String path;

  final SourceType type;

  @override
  String toString() {
    return 'CDNSource{locale: $locale, path: $path, type: $type}';
  }
}
