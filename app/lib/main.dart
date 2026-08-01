import 'package:flutter/widgets.dart';

import 'src/generated_status_source.dart';
import 'src/scaffold_app.dart';

const apiBaseUrl = String.fromEnvironment('API_BASE_URL');

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ScaffoldApp(
      apiBaseUrl: apiBaseUrl,
      statusSource: GeneratedStatusSource(baseUrl: apiBaseUrl),
    ),
  );
}
