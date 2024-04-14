import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mone_age/MainPages/HomePage/TotalInvestmentCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic data;
  double price = 0.0;
  double change = 0.0;
  String name = "";
  String symbol = "";
  int TotalInvestFD = 12360;
  double increment = 12.578;

  List<Widget> corousel = [];

  int _currentIndex = 0;

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  /*
  @override
  void initState() {
    super.initState();
    fetchDataFromAPI().then((result) {
      setState(() {
        data = result;
        if (data != null && data['stock'] != null) {
          final stock = data['stock'][0];
          name = stock['name'].toString();
          symbol = stock['symbol'].toString();
          price = stock['price'];
          change = stock['change_percent'];
        }
      });
      print(price);
      print(change);
    }).catchError((error) {
      print('Error fetching data: $error');
    });
  }
  */
  @override
  Widget build(BuildContext context) {
    corousel.insert(0, InvestmentCard(context, TotalInvestFD, increment));
    corousel.insert(1, InvestmentCard(context, TotalInvestFD, increment));
    corousel.insert(2, InvestmentCard(context, TotalInvestFD, increment));
    return Scaffold(
      // body: Center(
      //   child: InvestmentCard(context, TotalInvestFD, increment),
      // ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 6.9,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: onPageChanged,
              scrollDirection: Axis.horizontal,
            ),
            items: corousel.map(
              (i) {
                return Builder(
                  builder: (BuildContext context) {
                    return i;
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

/*
body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color(0xFF04c56a),
          ),
          height: 150.0,
          width: 190.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(symbol),
                Text("Current price : $price"),
                Text(
                  "Change : $change",
                  style: TextStyle(
                      color: (change > 0.0)
                          ? Colors.greenAccent
                          : Colors.redAccent),
                )
              ],
            ),
          ),
        ),
      ),
 */

/*
Container(
          padding: EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.width * 0.4,
          width: MediaQuery.of(context).size.width * 0.7,
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
                height: MediaQuery.of(context).size.width * 0.125,
              ),
              Text(
                "$TotalInvestFD.00",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                "Average Increment of 17%",
                style: TextStyle(
                  fontFamily: "Poppins-Light",
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
 */
