import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';

void showSellStocks(BuildContext ctx, double currentPrice, int boughtQuantity) {
  showModalBottomSheet(
    context: ctx,
    builder: (_) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        height: MediaQuery.of(ctx).size.height * 0.5,
        child: SellStocks(
          currentPrice: currentPrice,
          boughtQuantity: boughtQuantity,
        ),
      );
    },
    useSafeArea: true,
    isScrollControlled: true,
    clipBehavior:
        Clip.antiAliasWithSaveLayer, // Clip the content to rounded corners
  );
}

class SellStocks extends StatefulWidget {
  final double currentPrice;
  final int boughtQuantity;

  const SellStocks(
      {super.key, required this.currentPrice, required this.boughtQuantity});

  @override
  State<SellStocks> createState() => _SellStocksState();
}

class _SellStocksState extends State<SellStocks> {
  int sell_quantity = 10;
  double totalAmt = 0;

  double totalAmtCalc(double currentAmt) {
    double total_amt = (currentAmt * sell_quantity);
    return total_amt;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sell_quantity = widget.boughtQuantity;
      totalAmt = totalAmtCalc(widget.currentPrice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Sell Stock StockName',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                setState(() {});
              },
              child: Icon(
                Icons.close,
                color: Colors.white60,
              ),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quantity"),
                CountStepper(
                  iconColor: Color(0xFF47A678),
                  defaultValue: sell_quantity,
                  max: widget.boughtQuantity,
                  min: 1,
                  iconDecrementColor: Colors.redAccent,
                  splashRadius: 25,
                  onPressed: (value) {
                    setState(() {
                      sell_quantity = value;
                      totalAmt = totalAmtCalc(widget.currentPrice);
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Current Price"),
                Container(
                  padding: EdgeInsets.only(left: 16.0),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 48.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffB5B5C3)),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "${widget.currentPrice}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount"),
                Container(
                  padding: EdgeInsets.only(left: 16.0),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 48.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffbe3535)),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "$totalAmt",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 52,
              decoration: BoxDecoration(
                color: Color(0xff1495ff),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Text(
                  "Confirm Sell",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
