import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mone_age/Backend/Main%20Stocks/stockCard.dart';
import 'package:mone_age/Main_Stocks/Components/IndexCard.dart';
import 'package:mone_age/Main_Stocks/Components/StockCard.dart';

import '../Backend/Main Stocks/fetchGainLoss.dart';

ValueNotifier<List<Widget>> searchedList = ValueNotifier<List<Widget>>([]);
ValueNotifier<List<Widget>> top5Gainers = ValueNotifier<List<Widget>>([]);
ValueNotifier<List<Widget>> top5Losers = ValueNotifier<List<Widget>>([]);

class StockHome extends StatefulWidget {
  const StockHome({super.key});

  @override
  State<StockHome> createState() => _StockHomeState();
}

class _StockHomeState extends State<StockHome> {
  dynamic stocks;
  dynamic indice_nifty;
  dynamic indice_sensex;
  dynamic indice_niftyBank;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeIndices();
    fetchGainersList();
    fetchLosersList();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  Future<void> fetchGainersList() async {
    top5Gainers.value.clear();
    dynamic data = await fetchGainers();
    for (int i = 0; i < 5; i++) {
      dynamic indData = data[i];
      top5Gainers.value.add(StockCard(
        name: indData['name'],
        symbol: indData['symbol'],
        price: indData['price'],
        change: indData['change_percent'],
      ));
    }
    setState(() {});
  }

  Future<void> fetchLosersList() async {
    top5Losers.value.clear();
    dynamic data = await fetchLosers();
    for (int i = 0; i < 5; i++) {
      dynamic indData = data[i];
      top5Losers.value.add(StockCard(
        name: indData['name'],
        symbol: indData['symbol'],
        price: indData['price'],
        change: indData['change_percent'],
      ));
    }
    setState(() {});
  }

  Future<void> initializeStocks() async {
    stocks = await fetchIndex("SENSEX");
    if (stocks != null) {
      // print("Stocks: $stocks");
    } else {
      print("Failed to fetch stocks data.");
    }
  }

  Future<void> initializeIndices() async {
    indice_nifty = await fetchIndex("NIFTY50");
    indice_sensex = await fetchIndex("SENSEX");
    indice_sensex = await fetchIndex("NIFTY BANK");

    if (indice_nifty != null) {
      setState(() {});
    } else {
      print("No data was available to fetch!");
    }
    if (indice_sensex != null) {
      setState(() {});
    } else {
      print("No data was available to fetch!");
    }
    if (indice_niftyBank != null) {
      setState(() {});
    } else {
      print("No data was available to fetch!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.chevron_left,
          ),
        ),
        title: Text("MoneAge Stocks"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  (indice_nifty != null)
                      ? IndexCard(
                          name: indice_nifty['name'],
                          symbol: indice_nifty['symbol'],
                          price: indice_nifty['price'].toString(),
                          change: indice_nifty['change'].toString())
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(child: Text("No data to fetch"))),
                        ),
                  (indice_sensex != null)
                      ? IndexCard(
                          name: indice_sensex['name'],
                          symbol: indice_sensex['symbol'],
                          price: indice_sensex['price'].toString(),
                          change: indice_sensex['change'].toString())
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(child: Text("No data to fetch"))),
                        ),
                  (indice_niftyBank != null)
                      ? IndexCard(
                          name: indice_niftyBank['name'],
                          symbol: indice_niftyBank['symbol'],
                          price: indice_niftyBank['price'].toString(),
                          change: indice_niftyBank['change'].toString())
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(child: Text("No data to fetch"))),
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SearchBar(
                controller: searchController,
                leading: Icon(
                  CupertinoIcons.search,
                ),
                elevation: MaterialStateProperty.resolveWith((states) => 5.0),
                onSubmitted: (text) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Divider(
                color: Colors.white24,
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Top 5 Gainers",
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Column(
              children: top5Gainers.value,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Divider(
                color: Colors.white24,
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Top 5 Losers",
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Column(
              children: top5Losers.value,
            ),
          ],
        ),
      ),
    );
  }
}
