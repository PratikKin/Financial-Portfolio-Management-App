import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:http/http.dart' as http;

Future<List<Candle>> fetchCandles(String symbol) async {
  List<Candle> data = [];

  final uri = Uri.parse(
      "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$symbol.BSE&interval=5min&apikey=UQAE6H59OZ7DSGUH&outputsize=full&datatype=json");
  final res = await http.get(uri);

  if (res.statusCode == 200) {
    dynamic resBody = jsonDecode(res.body);

    var timeSeries = resBody["Time Series (Daily)"] as Map<String, dynamic>;
    timeSeries.forEach((dateString, dailyData) {
      var dailyMap = dailyData as Map<String, dynamic>;

      try {
        DateTime date = DateTime.parse(dateString);
        double open = double.parse(dailyMap["1. open"]);
        double close = double.parse(dailyMap["4. close"]);
        double high = double.parse(dailyMap["2. high"]);
        double low = double.parse(dailyMap["3. low"]);
        double volume = double.parse(dailyMap["5. volume"]);

        data.add(Candle(
            date: date,
            high: high,
            low: low,
            open: open,
            close: close,
            volume: volume));
      } catch (error) {
        print("Error parsing data: $error");
      }
    });
  } else {
    print("Error fetching data: Status code ${res.statusCode}");
  }

  return data;
}
