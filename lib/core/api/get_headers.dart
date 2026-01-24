import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiAuth {
  static final String _apiSecret = dotenv.env['SERVER_API']!;

  static Map<String, String> getAuthHeaders() {
    final timestamp = (DateTime.now().millisecondsSinceEpoch ~/ 1000)
        .toString();
    final signature = _generateSignature(timestamp);

    return {'X-Timestamp': timestamp, 'X-Signature': signature};
  }

  static String _generateSignature(String timestamp) {
    final key = utf8.encode(_apiSecret);
    final data = utf8.encode(timestamp);
    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(data);
    return digest.toString();
  }
}
