import 'package:flutter/material.dart';
import 'package:portfolio_management_ui/Pages/P-Pages/F.D.dart';
import 'package:portfolio_management_ui/Pages/P-Pages/RI.dart';
import 'package:portfolio_management_ui/Pages/P-Pages/Stocks.dart';

import '../../Design/Indicator_size.dart';

class P_Page extends StatefulWidget {
  const P_Page({super.key});

  @override
  State<P_Page> createState() => _P_PageState();
}

class _P_PageState extends State<P_Page> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TabBar(
            labelStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'RobotoSerif',
              color: Colors.white,
            ),
            labelColor: Colors.white,
            indicatorColor: Colors.white54,
            unselectedLabelColor: Colors.grey.shade400,
            controller: _tabController,
            dividerColor: Colors.transparent,
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
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              FD_pages(),
              Stock_Pages(),
              RI_Pages(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
