import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MainPages/HomePage.dart';

class SetupPassword extends StatefulWidget {
  final String mobileNo;
  const SetupPassword({super.key, required this.mobileNo});

  @override
  State<SetupPassword> createState() => _SetupPasswordState();
}

class _SetupPasswordState extends State<SetupPassword> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
                      controller: _passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Setup Password',
                          hintStyle: TextStyle(
                            fontFamily: "Salsa",
                          )),
                      keyboardType: TextInputType.visiblePassword,
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
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
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
                  String Password = _passwordController.text;
                  String ConfirmPassword = _confirmPasswordController.text;
                  if (Password == ConfirmPassword) {
                    Get.to(HomePage());
                  }
                },
                child: Text(
                  'Sign In',
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
