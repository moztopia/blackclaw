# dart-dio template overrides

`pubspec.mustache` raises the generated package's Dart SDK floor to 3.8. OpenAPI
Generator 7.22.0 declares Dart 3.5 while its `json_serializable` dependency can resolve to
a version that emits Dart 3.8 null-aware collection elements. Keep this override until the
upstream template and dependency bounds agree.
