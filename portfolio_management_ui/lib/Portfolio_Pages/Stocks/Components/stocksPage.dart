import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mone_age/Portfolio_Pages/Stocks/Components/buyStock.dart';
import 'package:mone_age/Portfolio_Pages/Stocks/Components/sellStock.dart';

//Only if Stock is bought

class StockPage extends StatefulWidget {
  final String stockName;
  final String stockSym;
  final double change;

  const StockPage(
      {super.key,
      required this.stockName,
      required this.stockSym,
      required this.change});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          CupertinoIcons.chevron_left,
          size: 20,
        ),
        // leadingWidth: 10,
        titleSpacing: -5,

        title: Text(widget.stockName),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.stockSym,
                    ),
                    Text(
                      "Current Price",
                      style: TextStyle(fontFamily: "Poppins-Thin"),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      (widget.change > 0.0)
                          ? CupertinoIcons.arrow_up_right
                          : CupertinoIcons.arrow_down_right,
                      color: (widget.change > 0.0)
                          ? Colors.greenAccent
                          : Colors.redAccent,
                      size: 16.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "${widget.change}%",
                      style: TextStyle(
                        fontSize: 12,
                        color: (widget.change > 0.0)
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        fontFamily: "Poppins-Light",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 8),
            child: Divider(
              color: Colors.white24,
            ),
          ),
          Container(
            height: 275,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Divider(
              color: Colors.white24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Today's Open",
                      style: TextStyle(fontFamily: "Poppins-Thin"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "12500",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Today's Close",
                      style: TextStyle(fontFamily: "Poppins-Thin"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "13500",
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Today's High",
                      style: TextStyle(fontFamily: "Poppins-Thin"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "13700",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Today's Low",
                      style: TextStyle(fontFamily: "Poppins-Thin"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "12200",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Divider(
              color: Colors.white24,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                showBuyStocks(context, 500.02);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 52,
                decoration: BoxDecoration(
                  color: Color(0xff377c77),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Text(
                    "Buy",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showSellStocks(context, 5000, 20);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 52,
                decoration: BoxDecoration(
                  color: Color(0xff8f3a23),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Text(
                    "Sell",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
