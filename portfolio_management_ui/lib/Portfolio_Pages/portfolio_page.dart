import 'package:flutter/material.dart';
import 'package:mone_age/Portfolio_Pages/FD/F.D.dart';
import 'package:mone_age/Portfolio_Pages/Real%20Estate/RE.dart';
import 'package:mone_age/Portfolio_Pages/Stocks/Stocks.dart';

import '../Features/FixedSizedTabIndicator.dart';

class MainP_Pages extends StatefulWidget {
  const MainP_Pages({super.key});

  @override
  State<MainP_Pages> createState() => _MainP_PagesState();
}

class _MainP_PagesState extends State<MainP_Pages>
    with SingleTickerProviderStateMixin {
  late TabController _tabBarController;

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set preferred height
        child: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            child: TabBar(
              controller: _tabBarController,
              labelColor: Colors.white,
              indicatorColor: Colors.white54,
              unselectedLabelColor: Colors.grey.shade400,
              indicator: FixedSizeTabIndicator(
                width: 50,
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  text: 'F.D.',
                ),
                Tab(
                  text: 'Stocks',
                ),
                Tab(
                  text: 'R.E.',
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              color: Color(0xff0F37AD),
            ),
          ),
        ),
      ),
      body: Expanded(
        child: TabBarView(
          controller: _tabBarController,
          children: [
            FD(),
            Stocks(),
            RE(),
          ],
        ),
      ),
    );
  }
}
