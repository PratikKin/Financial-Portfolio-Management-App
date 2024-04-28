import 'package:flutter/material.dart';
import 'package:mone_age/Backend/getNews.dart';
import 'package:mone_age/MainPages/HomePage/NewsCard.dart';
import 'package:mone_age/MainPages/HomePage/StockWallet.dart';

import '../../Backend/wallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWalletDetails();
    getNews();
    // updateList();
  }

  void updateList() {
    corousel.add(StockWallet(context, InvestedAmt, CurrentBalance));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  dynamic data;

  double CurrentBalance = 0.0;
  double InvestedAmt = 0.0;

  List<Widget> corousel = [];
  ValueNotifier<List<Widget>> newsDetails = ValueNotifier<List<Widget>>([]);

  dynamic news;

  void startTotalCards() {
    setState(() {
      // corousel.add(InvestmentCard(context, TotalInvestFD, returnAmt));
      // corousel.add(InvestmentCard(context, TotalInvestFD, increment));
    });
  }

  Future<void> getNews() async {
    newsDetails.value.clear();
    news = await GetNews();
    if (news != null) {
      for (int i = 0; i < news.length; i++) {
        dynamic indData = news[i];
        newsDetails.value.add(
          NewsCard(
            url: indData['article_url'],
            title: indData['article_title'],
            imageLink: indData['article_photo_url'],
            date: indData['post_time_utc'],
          ),
        );
      }
    } else {
      print("No data fetched!");
    }
    setState(() {});
  }

  Future<void> getWalletDetails() async {
    dynamic data = await getWallet();
    if (data != null) {
      setState(() {
        CurrentBalance = data['balance'];
        InvestedAmt = data['investedAmount'];
      });
    }
    updateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: InvestmentCard(context, TotalInvestFD, increment),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: corousel,
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
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text("Trending News"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: newsDetails.value,
            ),
          ],
        ),
      ),
    );
  }
}
