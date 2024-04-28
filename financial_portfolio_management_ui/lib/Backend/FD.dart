import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Authentication.dart';

class FixedDeposit {
  Future<bool> createFD(
    String fdName,
    String bankName,
    String fdType,
    int amtDeposited,
    double interestRate,
    String investDate,
    String matureDate,
    String notes,
  ) async {
    final userId = await storage.read(key: userIdKey);
    print("user : $userId");
    final Uri uri = Uri.parse('$baseUrl/user/$userId/create_fd');

    double totalAmt = amtDeposited + (amtDeposited * interestRate / 100);
    if(fdType == "Monthly") totalAmt = totalAmt * 1.0;
    else if(fdType == "Quarterly") totalAmt = totalAmt * 0.25;
    if(fdType == "Yearly") totalAmt = totalAmt / 12.0;

    print(userID);

    final Map<String, dynamic> postData = {
      "fdName": fdName,
      "bankName": bankName,
      "fdType": fdType,
      "amountdeposited": amtDeposited,
      "IR": interestRate,
      "investedDate": investDate,
      "maturityDate": matureDate,
      "totalAmount": totalAmt,
      "notes": notes,
    };

    final String postBody = jsonEncode(postData);
    print(userId);

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

  Future<dynamic> getAllFD() async {
    final userId = await storage.read(key: userIdKey);
    final Uri uri = Uri.parse('$baseUrl/user/$userId/fds');

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

  Future<bool> deleteFD(String fdId) async {
    final userId = await storage.read(key: userIdKey);
    final Uri uri = Uri.parse('$baseUrl/user/$userId/fds/$fdId');

    try {
      final http.Response response = await http.delete(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        print(response.body);
        return responseBody['success'];
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> updateFD(
      String fdId,
      String fdName,
      String bankName,
      int amountDeposited,
      double ir,
      String investDate,
      String matureDate,
      double totalAmt,
      String notes) async {
    final userId = await storage.read(key: userIdKey);
    final Uri uri = Uri.parse('$baseUrl/user/$userId/fds/$fdId');

    final Map<String, dynamic> postData = {
      "fdName": fdName,
      "bankName": bankName,
      "amountdeposited": amountDeposited,
      "IR": ir,
      "investedDate": investDate,
      "maturityDate": matureDate,
      "totalAmount": totalAmt,
      "notes": notes
    };

    final String postBody = jsonEncode(postData);

    try {
      final http.Response response = await http.put(uri,
          headers: {
            'Content-Type': 'application/json',
          },
          body: postBody);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        print(response.body);
        return responseBody['success'];
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
