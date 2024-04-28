import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> fetchCardDetails(String stockSym) async {
  final Uri uri =
      Uri.parse('https://real-time-finance-data.p.rapidapi.com/search');

  final Map<String, String> headers = {
    'X-RapidAPI-Key': 'b67856ee15mshabf25a01b7791c7p180269jsn045b9ffd6288',
    'X-RapidAPI-Host': 'real-time-finance-data.p.rapidapi.com',
  };
  final Map<String, String> params = {
    'query': stockSym,
    'language': 'en',
  };

  final response =
      await http.get(uri.replace(queryParameters: params), headers: headers);
  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    Map<dynamic, dynamic> jsonBody = json["data"]["stock"][0];
    return jsonBody;
  } else {
    throw Exception('Failed to load data from API');
  }
}

Future<dynamic> fetchIndex(String indexSym) async {
  final Uri uri =
      Uri.parse('https://real-time-finance-data.p.rapidapi.com/search');

  final Map<String, String> headers = {
    'X-RapidAPI-Key': 'fccfda07b8msh04001d6c96b1c73p1a4833jsn229f8ef31366',
    'X-RapidAPI-Host': 'real-time-finance-data.p.rapidapi.com',
  };
  final Map<String, String> params = {
    'query': indexSym,
    'language': 'en',
  };

  final response = await http.get(
    uri.replace(queryParameters: params),
    headers: headers,
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    // print(json);
    Map<dynamic, dynamic> jsonBody = json["data"]["index"][0];
    return jsonBody;
  } else {
    throw Exception('Failed to load data from API');
  }
}
