import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Authentication.dart';

Future<bool> buyStock(
    String name, String sym, double price, int quantity) async {
  final Uri uri = Uri.parse('$baseUrl/user/buy');
  final userId = await storage.read(key: userIdKey);

  final Map<String, dynamic> postData = {
    "userId": userId,
    "quantity": quantity,
    "price": price,
    "name": name,
    "symbol": sym,
  };

  final String postBody = jsonEncode(postData);

  try {
    final http.Response response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: postBody,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print("status");
      print("body: $responseBody");
      return responseBody['success'];
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error: $e');
  }
  return false;
}

Future<bool> sellStock(
    String name, String sym, double price, int quantity) async {
  final Uri uri = Uri.parse('$baseUrl/user/buy');
  final userId = await storage.read(key: userIdKey);

  final Map<String, dynamic> postData = {
    "userId": userId,
    "stockId": "662d4c563388985dc456abdc",
    "quantity": quantity,
    "sellPrice": price
  };

  final String postBody = jsonEncode(postData);

  try {
    final http.Response response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: postBody,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print("status");
      print("body: $responseBody");
      return responseBody['success'];
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error: $e');
  }
  return false;
}
