import 'dart:async';

import 'package:app/src/scaffold_app.dart';
import 'package:app/src/status/status_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const baseUrl = 'http://api.test';

  testWidgets('shows loading and then the API status', (tester) async {
    final response = Completer<ApiStatus>();
    final source = _FakeStatusSource(() => response.future);

    await tester.pumpWidget(
      ScaffoldApp(statusSource: source, apiBaseUrl: baseUrl),
    );

    expect(find.text('Checking API connection…'), findsOneWidget);
    expect(find.text(baseUrl), findsOneWidget);

    response.complete(const ApiStatus(status: 'ok', service: 'blackclaw-api'));
    await tester.pumpAndSettle();

    expect(find.text('API is online'), findsOneWidget);
    expect(find.text('blackclaw-api · ok'), findsOneWidget);
    expect(source.calls, 1);
  });

  testWidgets('shows an error and retries the request', (tester) async {
    var shouldFail = true;
    final source = _FakeStatusSource(() async {
      if (shouldFail) throw Exception('offline');
      return const ApiStatus(status: 'ok', service: 'blackclaw-api');
    });

    await tester.pumpWidget(
      ScaffoldApp(statusSource: source, apiBaseUrl: baseUrl),
    );
    await tester.pumpAndSettle();

    expect(find.text("Couldn’t reach the API"), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);

    shouldFail = false;
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();

    expect(find.text('API is online'), findsOneWidget);
    expect(source.calls, 2);
  });
}

class _FakeStatusSource implements StatusSource {
  _FakeStatusSource(this._response);

  final Future<ApiStatus> Function() _response;
  int calls = 0;

  @override
  Future<ApiStatus> fetchStatus() {
    calls += 1;
    return _response();
  }
}
