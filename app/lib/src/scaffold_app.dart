import 'package:flutter/material.dart';

import 'status/status_screen.dart';
import 'status/status_source.dart';

class ScaffoldApp extends StatelessWidget {
  const ScaffoldApp({
    required this.statusSource,
    required this.apiBaseUrl,
    super.key,
  });

  final StatusSource statusSource;
  final String apiBaseUrl;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scaffold',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE84855),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8F7),
        useMaterial3: true,
      ),
      home: StatusScreen(statusSource: statusSource, apiBaseUrl: apiBaseUrl),
    );
  }
}
