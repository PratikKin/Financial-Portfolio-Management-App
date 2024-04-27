import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<void> fetchAndStoreCardDetails(String stockSym) async {
  final Uri uri = Uri.parse('https://www.alphavantage.co//query');
  final Map<String, String> params = {
    'function': 'TIME_SERIES_DAILY',
    'symbol': 'SBIN.BSE',
    'interval': '5min',
    'apikey': '5OIPMQ6P0QV3ODAC',
    'outputsize': 'full',
    'datatype': 'json',
  };

  final response = await http.get(
    uri.replace(queryParameters: params),
    headers: {'User-Agent': 'request'},
  );
  if (response.statusCode == 200) {
    dynamic jsonBody = jsonDecode(response.body);
    print(jsonBody);
  } else {
    throw Exception('Failed to load data from API');
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  fetchAndStoreCardDetails('SBIN.BSE');
}
