import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Authentication.dart';

Future<dynamic> getWallet() async {
  final userId = await storage.read(key: userIdKey);

  final Uri uri = Uri.parse('$baseUrl/user/$userId/wallet');

  try {
    final http.Response response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      dynamic data = responseBody['data'];
      return data;
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return null;
    }
  } catch (e) {
    print('Error: $e');
  }
}
