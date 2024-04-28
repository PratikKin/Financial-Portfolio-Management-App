import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mone_age/MainPages/Settings/MainComponents.dart';
import 'package:mone_age/Sign-In-Up/SignUp.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../Backend/Authentication.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void updateUserID() async {
    await storage.write(key: userIdKey, value: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c242e),
        automaticallyImplyLeading: false,
        bottomOpacity: 0.5,
        elevation: 5.0,
        title: Text("Settings"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Get.isDarkMode
                ? CupertinoIcons.moon_fill
                : CupertinoIcons.sun_max),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                  ),
                  SizedBox(
                    width: 39.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Joe Baden",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("joe.baden@gmail.com"),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Divider(), //d1
              SizedBox(
                height: 30.0,
              ),
              ComponentCards(
                  CupertinoIcons.person_crop_square_fill, "Manage Profile"),
              SizedBox(
                height: 20.0,
              ),
              ComponentCards(FontAwesomeIcons.key, "Change Password"),
              SizedBox(
                height: 20.0,
              ),
              ComponentCards(CupertinoIcons.question_square, "How to Use?"),
              SizedBox(
                height: 25.0,
              ),
              Divider(), //d2
              SizedBox(
                height: 30.0,
              ),
              ComponentCards(CupertinoIcons.bell_fill, "Notifications"),
              SizedBox(
                height: 20.0,
              ),
              ComponentCards(Icons.language_sharp, "Change Language"),

              SizedBox(
                height: 20.0,
              ),
              ComponentCards(CupertinoIcons.person, "Manage Profile"),
              SizedBox(
                height: 20.0,
              ),
              ComponentCards(CupertinoIcons.text_bubble, "Feedback"),
              SizedBox(
                height: 25.0,
              ),

              Divider(), //d3
              SizedBox(
                height: 30.0,
              ),
              ComponentCards(CupertinoIcons.star_lefthalf_fill, "Rate Us!"),

              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.center,
                height: 48,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xffff143f),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                      (route) => false, // Removes all routes from the stack
                    );
                    setState(() {
                      updateUserID();
                    });
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.success(
                        iconPositionLeft: 4.0,
                        icon: Icon(
                          FontAwesomeIcons.hand,
                          size: 60.0,
                        ),
                        backgroundColor: Color(0xff1495ff),
                        message: "Signed Out Successfully!",
                      ),
                    );
                  },
                  child: const Center(
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
