import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mone_age/MainPages/Settings.dart';

import 'MainPages/HomePage.dart';
import 'Portfolio_Pages/portfolio_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _getBody(_currentIndex),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xff0F37AD),
        color: Colors.white,
        style: TabStyle.reactCircle,
        items: [
          TabItem(icon: Icons.home),
          TabItem(icon: FontAwesomeIcons.wallet),
          TabItem(icon: Icons.settings),
        ],
        initialActiveIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Image.asset(
              "assets/app_name_logo.png",
              width: 124,
              height: 28,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
              )
            ],
            backgroundColor: Color(0xff0F37AD),
          ),
          body: HomePage(),
        );
      case 1:
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Image.asset(
              "assets/app_name_logo.png",
              width: 124,
              height: 28,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
              )
            ],
            backgroundColor: Color(0xff0F37AD),
          ),
          body: MainP_Pages(),
        );
      case 2:
        return Settigns();
      default:
        return Container(
          child: Text(
            "Unable to load pages!",
          ),
        );
    }
  }
}
