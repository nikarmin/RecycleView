import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get chave => _get('CHAVE_FIREBASE');

  static String _get(String nome) => DotEnv().env[nome] ?? '';
}
