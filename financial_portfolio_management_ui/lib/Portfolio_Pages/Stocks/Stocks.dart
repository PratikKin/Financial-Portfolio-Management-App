import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mone_age/Main_Stocks/Stocks_Home.dart';
import 'package:mone_age/Portfolio_Pages/Stocks/Components/StocksCard.dart';

import '../../Backend/Main Stocks/getAllStocks.dart';

ValueNotifier<List<Widget>> Stocks_List = ValueNotifier<List<Widget>>([]);

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  late StreamController _controller;
  late StreamSubscription _subscription;
  dynamic StocksData;

  @override
  void initState() {
    super.initState();
    _controller = StreamController.broadcast();
    _subscription = _controller.stream.listen((_) {
      if (mounted) {
        setState(() {});
      }
    });
    startRefreshing();
    initializedata();
  }

  Future<void> initializedata() async {
    startRefreshing();
    StocksData = await getAllStocks();
    updateList();
  }

  void startRefreshing() {
    Timer.periodic(Duration(microseconds: 100), (timer) {
      _controller.add(null); // Add an event to the stream
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void updateList() {
    if (StocksData != null) {
      Stocks_List.value.clear();
      dynamic d = StocksData["data"];
      for (int i = 0; i < d.length; i++) {
        dynamic data = d[i]['stock'];
        dynamic dc = d[i];
        Stocks_List.value.add(stocksCard(
            stockName: data['name'],
            stockSymbol: data['symbol'],
            InvestedAmt: dc['buyPrice'],
            quantity: dc['quantity']!));
        Stocks_List.value = List.from(Stocks_List.value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Stocks_List.value.isEmpty)
          ? Center(
              child: Text(
                "No Stocks Recorded!",
              ),
            )
          : ListView.builder(
              itemCount: Stocks_List.value.length,
              itemBuilder: (BuildContext context, int index) {
                return Stocks_List.value[index];
              },
            ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Color(0xFF333333),
        ),
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            // showAddPortfolio(context, 1);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => StockHome()));
            _controller.add(null);
          },
        ),
      ),
    );
  }
}
