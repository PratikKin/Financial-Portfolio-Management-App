import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Candle> candles = [];
  bool themeIsDark = false;

  @override
  void initState() {
    fetchCandles().then((value) {
      setState(() {
        candles = value;
      });
    });
    super.initState();
  }

  Future<List<Candle>> fetchCandles() async {
    final uri = Uri.parse(
        "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=SBIN.BSE&interval=5min&apikey=UQAE6H59OZ7DSGUH&outputsize=full");
    final res = await http.get(uri);
    dynamic jsonData = jsonDecode(res.body);
    final Map<String, dynamic> body = jsonData['Time Series (Daily)'];
    List<String> dates = body.keys.toList();
    for (int i = 0; i < body.length; i++) {
      candles.add(Candle(
          date: dates[i] as DateTime,
          high: body[i]['high'],
          low: body[i]['low'],
          open: body[i]['open'],
          close: body[i]['close'],
          volume: body[i]['volume']));
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeIsDark ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("BTCUSDT 1H Chart"),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  themeIsDark = !themeIsDark;
                });
              },
              icon: Icon(
                themeIsDark
                    ? Icons.wb_sunny_sharp
                    : Icons.nightlight_round_outlined,
              ),
            )
          ],
        ),
        body: Center(
          child: Candlesticks(
            candles: candles,
          ),
        ),
      ),
    );
  }
}
