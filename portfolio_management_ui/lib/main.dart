import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mone_age/BasePage.dart';
import 'package:mone_age/MainPages/HomePage.dart';
import 'package:mone_age/Portfolio_Pages/FD/F.D.dart';
import 'package:mone_age/Portfolio_Pages/Real%20Estate/RE.dart';
import 'package:mone_age/Portfolio_Pages/Real%20Estate/addRE.dart';
import 'package:mone_age/Portfolio_Pages/Stocks/Stocks.dart';
import 'package:mone_age/Portfolio_Pages/Stocks/addStocks.dart';
import 'package:mone_age/Sign-In-Up/SignIn.dart';
import 'package:mone_age/Sign-In-Up/SignUp.dart';

import 'Portfolio_Pages/FD/addFD.dart';
import 'Portfolio_Pages/portfolio_page.dart';

void main() {
  runApp(MoneAge());
}

class MoneAge extends StatelessWidget {
  const MoneAge({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      debugShowCheckedModeBanner: false,
      // home: FD_Calculator(),
      initialRoute: "SignUp",
      routes: {
        "Base": (route) => BasePage(),
        "Home": (route) => HomePage(),
        "SignIn": (route) => SignIn(),
        "SignUp": (route) => SignUpPage(),
        "F.D.": (route) => FD(),
        "addFD": (route) => addFD(),
        "Stocks": (route) => Stocks(),
        "addStocks": (route) => addStocks(),
        "R.E.": (route) => RE(),
        "addRE": (route) => addRE(),
        "Portfolio": (route) => MainP_Pages(),
      },
    );
  }
}
