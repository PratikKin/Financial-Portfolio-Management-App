import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settigns extends StatefulWidget {
  const Settigns({super.key});

  @override
  State<Settigns> createState() => _SettignsState();
}

class _SettignsState extends State<Settigns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Settings"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.sun_max),
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
                    radius: 55.0,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.person_crop_square_fill,
                        size: 28.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Manage Profile",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Icon(CupertinoIcons.chevron_right),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.key,
                        size: 28.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Change Password",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Icon(CupertinoIcons.chevron_right),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.question_square,
                        size: 28.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "How to Use?",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Icon(CupertinoIcons.chevron_right),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Divider(), //d2
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.bell_fill,
                        size: 28.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Notifications",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Icon(CupertinoIcons.chevron_right),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/language.png"),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Change Language",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Icon(CupertinoIcons.chevron_right),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/assist.png"),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Manage Profile",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Icon(CupertinoIcons.chevron_right),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.text_bubble,
                        size: 28.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Feedback",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Icon(CupertinoIcons.chevron_right),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),

              Divider(), //d3
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.star_lefthalf_fill,
                        size: 28.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Rate Us!",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Icon(CupertinoIcons.chevron_right),
                ],
              ),

              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.center,
                height: 48,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xff9d1111)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "SignUp");
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
