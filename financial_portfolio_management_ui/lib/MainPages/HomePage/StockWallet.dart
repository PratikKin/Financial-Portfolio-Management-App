import 'package:flutter/material.dart';

Widget StockWallet(
    BuildContext ctx, double InvestAmt, double RemainingBalance) {
  String investAmt = InvestAmt.toStringAsFixed(2);
  String remainBalance = RemainingBalance.toStringAsFixed(2);
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Container(
      padding: EdgeInsets.all(20.0),
      // height: MediaQuery.of(ctx).size.height * 0.26,
      width: MediaQuery.of(ctx).size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          tileMode: TileMode.mirror,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff123c57),
            Color(0xff14212e),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Total Amount Invested (Stocks)",
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: "Poppins-Light",
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                investAmt,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Divider(
              color: Colors.white24,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Remaining Balance",
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: "Poppins-Light",
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                remainBalance,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
