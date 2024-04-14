import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mone_age/Portfolio_Pages/Stocks/Components/StocksCard.dart';

import '../../Features/selectBottomSheet.dart';

ValueNotifier<List<Widget>> Stocks_List = ValueNotifier<List<Widget>>([]);

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  late StreamController _controller;
  late StreamSubscription _subscription;

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

  /*
   (Stocks_List.value.isNotEmpty)
          ? ListView.builder(
              itemCount: Stocks_List.value.length,
              itemBuilder: (BuildContext context, int index) {
                return Stocks_List.value[index];
              },
            )
          : Center(
              child: Text("No Stocks Recorded!"),
            ),
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          stocksCard(stockName: "Stock 1", stockSymbol: "STK1", InvestedAmt: 253401.0, increment: 10.02),
          stocksCard(stockName: "Stock 2", stockSymbol: "STK2", InvestedAmt: 253.0, increment: -1.02),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Color(0xFF333333),
        ),
        child: IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () {
            showAddPortfolio(context, 1);
            _controller.add(null);
          },
        ),
      ),
    );
  }
}
