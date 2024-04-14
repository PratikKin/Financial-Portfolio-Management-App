import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

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
    try {
      // Read the JSON file from assets
      String jsonString = await rootBundle.loadString('assets/data.json');
      // Parse the JSON string
      List<dynamic> jsonData = jsonDecode(jsonString);
      // Map JSON data to Candle objects
      List<Candle> candles = jsonData.map((e) => Candle.fromJson(e)).toList();
      // Reverse the list of candles
      candles = candles.reversed.toList();
      return candles;
    } catch (e) {
      // Error handling if file reading or JSON parsing fails
      print('Error fetching candles: $e');
      return [];
    }
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
