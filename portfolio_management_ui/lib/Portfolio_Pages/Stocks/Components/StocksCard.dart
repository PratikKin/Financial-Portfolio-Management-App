import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stocksCard extends StatefulWidget {
  final String stockName;
  final String stockSymbol;
  final double InvestedAmt;
  final double increment;

  const stocksCard(
      {super.key,
      required this.stockName,
      required this.stockSymbol,
      required this.InvestedAmt,
      required this.increment});

  @override
  State<stocksCard> createState() => _stocksCardState();
}

class _stocksCardState extends State<stocksCard> {
  late Color color1;
  late Color color2;

  // Color c = Color(0xffff3400);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color1 = (widget.increment > 0.0) ? Color(0xff132c2b) : Color(0xff2c1813);
    color2 = (widget.increment > 0.0) ? Color(0xff133730) : Color(0xff371813);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              strokeAlign: BorderSide.strokeAlignInside,
              color: (widget.increment > 0.0)
                  ? Color(0xff099658).withOpacity(0.3)
                  : Color(0xff962f09).withOpacity(0.3),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.mirror,
              colors: [
                // Color(0xff133730),
                color1,
                // Color(0xff132c2b),
                color2,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.stockName),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      widget.stockSymbol,
                      style: TextStyle(fontFamily: "Poppins-Thin"),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: (widget.increment > 0.0)
                          ? Color(0xff099658).withOpacity(0.3)
                          : Color(0xff962f09).withOpacity(0.3),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.mirror,
                      colors: [
                        // Color(0xff132c2b),
                        color2,
                        // Color(0xff133730),
                        color1,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.InvestedAmt}"),
                        Container(
                          // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28.0),
                            border: Border.all(
                              color: (widget.increment > 0.0)
                                  ? Color(0xff099658).withOpacity(0.3)
                                  : Color(0xff962f09).withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                (widget.increment > 0.0)
                                    ? CupertinoIcons.arrow_up_right
                                    : CupertinoIcons.arrow_down_right,
                                color: (widget.increment > 0.0)
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                                size: 16.0,
                              ),
                              Text(
                                "${widget.increment}%",
                                style: TextStyle(
                                  color: (widget.increment > 0.0)
                                      ? Colors.greenAccent
                                      : Colors.redAccent,
                                  fontFamily: "Poppins-Light",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
