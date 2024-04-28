import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Backend/Authentication Manager/AuthManager.dart';
import 'BasePage.dart';
import 'MainPages/Settings/Settings.dart';
import 'Portfolio_Pages/portfolio_page.dart';
import 'Sign-In-Up/SignIn.dart';
import 'Sign-In-Up/SignUp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthManager authManager = AuthManager();
  await authManager.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MoneAge());
}

class MoneAge extends StatelessWidget {
  MoneAge({super.key});

  final darkColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF333333),
    onPrimary: Colors.white,
    secondary: Colors.blueGrey,
    onSecondary: Colors.white,
    error: Color(0xFFCF6674),
    onError: Colors.white,
    background: Color(0xFF121212),
    onBackground: Colors.white,
    surface: Color(0xFF1F1F1F),
    onSurface: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // brightness: Brightness.dark,
        colorScheme: darkColorScheme,
        fontFamily: "Poppins",
      ),

      home: FutureBuilder(
        future: AuthManager().isLoggedIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingAnimationWidget.dotsTriangle(
              color: Colors.blueAccent.shade400,
              size: 200,
            );
          } else {
            if (snapshot.hasError) {
              // Handle error case
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.data != null && snapshot.data!) {
              // User is logged in, navigate to home
              return BasePage();
            } else {
              return SignUpPage();
            }
          }
        },
      ),

      /*
      home: StockPage(
        stockName: "SBI",
        stockSym: "SBIN",
        change: 2.028,
      ),
      */
      // home: StockHome(),
      debugShowCheckedModeBanner: false,
      routes: {
        "Base": (route) => BasePage(),
        "SignIn": (route) => SignIn(),
        "SignUp": (route) => SignUpPage(),
        "Settings": (route) => Settings(),
        "Portfolio": (route) => MainP_Pages(),
      },
    );
  }
}
