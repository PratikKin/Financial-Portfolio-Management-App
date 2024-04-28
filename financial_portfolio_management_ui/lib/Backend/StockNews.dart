import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> fetchDataFromAPI() async {
  final Uri uri =
      Uri.parse('https://real-time-finance-data.p.rapidapi.com/search');

  final Map<String, String> headers = {
    'X-RapidAPI-Key': '00c00a40ecmsh68c190c1e055ff2p1d5801jsna19a42bbb063',
    'X-RapidAPI-Host': 'real-time-finance-data.p.rapidapi.com',
  };
  final Map<String, String> params = {
    'query': 'Apple',
    'language': 'en',
  };

  final response =
      await http.get(uri.replace(queryParameters: params), headers: headers);
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return json['data'];
  } else {
    throw Exception('Failed to load data from API');
  }
}
