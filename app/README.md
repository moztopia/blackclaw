# Mobile app

Flutter client for the scaffold. The starter screen calls the Laravel status endpoint
through the generated OpenAPI package in `../packages/api-client-dart`.

## Run locally

Start the API, fetch packages, and run the app:

```bash
make run-app
```

This reads `APP_NAME` from the root `.env` and automatically passes
`--dart-define=API_BASE_URL=http://{APP_NAME}.localhost` to Flutter.

To override the URL manually:

```bash
cd app && flutter run --dart-define=API_BASE_URL=http://192.168.1.20:8000
```

## Check the scaffold

```bash
flutter analyze
flutter test
```

Widget tests inject a fake status source and never make network requests. The
generated client is isolated in `lib/src/generated_status_source.dart` so API
contract changes only need one app-side mapping update.
