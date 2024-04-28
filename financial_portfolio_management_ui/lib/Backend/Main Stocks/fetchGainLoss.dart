import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> fetchGainers() async {
  final Uri uri =
      Uri.parse('https://real-time-finance-data.p.rapidapi.com/market-trends');

  final Map<String, String> headers = {
    'X-RapidAPI-Key': 'fccfda07b8msh04001d6c96b1c73p1a4833jsn229f8ef31366',
    'X-RapidAPI-Host': 'real-time-finance-data.p.rapidapi.com'
  };
  final Map<String, String> params = {
    'trend_type': 'GAINERS',
    'country': 'ind',
    'language': 'en'
  };

  final response =
      await http.get(uri.replace(queryParameters: params), headers: headers);
  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    dynamic jsonBody = json["data"]["trends"];
    return jsonBody;
  } else {
    throw Exception('Failed to load data from API');
  }
}

Future<dynamic> fetchLosers() async {
  final Uri uri =
      Uri.parse('https://real-time-finance-data.p.rapidapi.com/market-trends');

  final Map<String, String> headers = {
    'X-RapidAPI-Key': 'fccfda07b8msh04001d6c96b1c73p1a4833jsn229f8ef31366',
    'X-RapidAPI-Host': 'real-time-finance-data.p.rapidapi.com'
  };
  final Map<String, String> params = {
    'trend_type': 'LOSERS',
    'country': 'ind',
    'language': 'en'
  };

  final response =
      await http.get(uri.replace(queryParameters: params), headers: headers);
  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    dynamic jsonBody = json["data"]["trends"];
    return jsonBody;
  } else {
    throw Exception('Failed to load data from API');
  }
}
