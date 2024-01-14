import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_management_ui/Pages/Login/SignUp/VerifyUsingOTP.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Enter Your Mobile Number Associated with Aadhar",
                style: TextStyle(
                  fontFamily: "Salsa",
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Color(0xffd1d1d1),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    // color: Colors.grey.withOpacity(
                    //   0.3,
                    // ),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Mobile Number',
                          hintStyle: TextStyle(
                            fontFamily: "Salsa",
                          )),
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: false,
                        decimal: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Color(0xff62DB63)),
                  elevation: MaterialStateProperty.resolveWith((states) => 5.0),
                ),
                onPressed: () {
                  String mNumber = _textController.text;
                  Get.to(VerifyUsingOTP(mobileNo: mNumber));
                },
                child: Text(
                  'Get OTP',
                  style: TextStyle(
                    fontFamily: "Salsa",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
