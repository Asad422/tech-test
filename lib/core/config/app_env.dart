import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class AppEnv {
  static String get googleServerClientId {
    final v = dotenv.env['GOOGLE_SERVER_CLIENT_ID'];
    if (v == null || v.trim().isEmpty) {
      throw StateError(
        'GOOGLE_SERVER_CLIENT_ID is missing. Copy .env.example to .env and set your OAuth 2.0 Web client ID.',
      );
    }
    return v.trim();
  }
}
