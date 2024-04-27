import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockCard extends StatefulWidget {
  final String name;
  final String symbol;
  final String price;
  final double change;

  const StockCard(
      {super.key,
      required this.name,
      required this.symbol,
      required this.price,
      required this.change});

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Container(
        height: 92,
        width: MediaQuery.of(context).size.width * 0.92,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
            color: Colors.white10),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    widget.symbol,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Poppins-Thin",
                        color: Colors.white,
                        fontWeight: FontWeight.w100),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹ ${widget.price}",
                    style: TextStyle(color: Colors.white),
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
            ],
          ),
        ),
      ),
    );
  }
}
