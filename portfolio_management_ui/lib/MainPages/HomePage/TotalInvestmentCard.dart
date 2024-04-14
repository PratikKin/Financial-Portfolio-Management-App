import 'package:flutter/cupertino.dart';

Widget InvestmentCard(BuildContext ctx, int InvestedAmt, double increment) {
  return Container(
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "F.D. Amount Invested",
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: "Poppins-Light",
              ),
            ),
            Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                color: Color(0xffff8a00),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(
                CupertinoIcons.arrow_right,
                color: Color(0xff222234),
                size: 16.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(ctx).size.width * 0.125,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$InvestedAmt",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              "Change : $increment%",
              style: TextStyle(
                fontFamily: "Poppins-Light",
                fontSize: 12.0,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
