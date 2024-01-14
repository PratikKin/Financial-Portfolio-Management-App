import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_management_ui/Pages/Login/SignUp/SetupPassword.dart';

class VerifyUsingOTP extends StatefulWidget {
  final String mobileNo;
  const VerifyUsingOTP({super.key, required this.mobileNo});

  @override
  State<VerifyUsingOTP> createState() => _VerifyUsingOTPState();
}

class _VerifyUsingOTPState extends State<VerifyUsingOTP> {
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.mobileNo,
                          hintStyle: TextStyle(
                            fontFamily: "Salsa",
                          )),
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: false,
                        decimal: false,
                      ),
                      enabled: false,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
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
                      controller: _otpController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter OTP recieved',
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
                  Get.to(SetupPassword(mobileNo: widget.mobileNo));
                },
                child: Text(
                  'Proceed',
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
