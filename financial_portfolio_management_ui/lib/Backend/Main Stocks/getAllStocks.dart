import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Authentication.dart';

Future<dynamic> getAllStocks() async {
  final userId = await storage.read(key: userIdKey);
  final Uri uri = Uri.parse('$baseUrl/user/$userId/stocks');

  print("user: $userId");

  try {
    final http.Response response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print(response.body);
      return responseBody;
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
