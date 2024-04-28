import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mone_age/MainPages/Settings/Settings.dart';

import 'MainPages/HomePage/HomePage.dart';
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
      body: _getBody(_currentIndex),
      bottomNavigationBar: ConvexAppBar(
        elevation: 15.0,
        backgroundColor: Color(0xff1c242e),
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
                  ))
            ],
            // backgroundColor: Color(0xff0F37AD),
            backgroundColor: Color(0xff1c242e),
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
            backgroundColor: Color(0xff1c242e),
          ),
          body: MainP_Pages(),
        );
      case 2:
        return Settings();
      default:
        return Container(
          child: Text(
            "Unable to load pages!",
          ),
        );
    }
  }
}
