import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_management_ui/Pages/Login/SignUp/Signup.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1.0,
        width: MediaQuery.of(context).size.width * 1.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/background.png",
            ),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 200.0),
            child: Container(
              height: 40.0,
              width: 159.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff415DEC),
                    Color(0xff282179),
                  ],
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextButton(
                onPressed: () {
                  Get.to(SignUp());
                },
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontFamily: "Salsa",
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
