import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

String userID = ""; // used for global user
const String userIdKey = "userID";
const String baseUrl = "http://10.0.1.211:5000";
final storage = FlutterSecureStorage();

class Authentication {
  Future<String> signUp(String name, String email, String password) async {
    final Uri uri = Uri.parse('$baseUrl/user/signup');

    final Map<String, String> postData = {
      'name': name,
      'email': email,
      'password': password,
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
        // print(response.body);
        return responseBody['status'];
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        // return -1;
        return "Failed";
      }
    } catch (e) {
      print('Error: $e');
      return "Failed";
    }
  }

  Future<dynamic> signIn(String email, String password) async {
    final Uri uri = Uri.parse('$baseUrl/user/login');

    final Map<String, String> postData = {
      'email': email,
      'password': password,
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
        String userId = responseBody['data'][0]['_id'].toString();

        try {
          if (userId != null) {
            await storage.write(key: userIdKey, value: userId);
            userID = userId;
            print("User ID stored successfully");
            print(userID);
          }
          return responseBody['status'];
        } catch (e) {
          print("Error storing user ID: $e");
          return "Failed";
        }
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return "Failed";
      }
    } catch (e) {
      print('Error: $e');
      return "Failed";
    }
  }
}
