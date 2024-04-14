import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mone_age/Backend/Authentication.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../Backend/Authentication Manager/AuthManager.dart';
import '../Components/PasswordField.dart';
import '../Components/TextFieldSignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _signEmail = TextEditingController();
  final TextEditingController _signPassword = TextEditingController();

  bool _obscureText = true;

  Authentication user = Authentication();

  @override
  void dispose() {
    _signEmail.dispose();
    _signPassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0.0,
        title: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Color(0xff1F7F8B),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/user_signup.png",
                  height: 300.0,
                  width: 300.0,
                ),
              ),
              const Text(
                "Sign In your account",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 26.40,
              ),
              TextFieldSignUp(
                controller: _signEmail,
                iconUsed: CupertinoIcons.mail,
                hintText: "Email",
                keyBoard: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 26.40,
              ),
              PasswordField(
                controller: _signPassword,
                iconUsed: CupertinoIcons.lock,
                hintText: "Password",
                obscureText: _obscureText,
              ),
              const SizedBox(
                height: 26.40,
              ),
              Container(
                alignment: Alignment.center,
                height: 48,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xff23213D)),
                child: TextButton(
                  onPressed: () async {
                    var connectivityResult =
                        await Connectivity().checkConnectivity();
                    if (connectivityResult != ConnectivityResult.none) {
                      String email = _signEmail.text;
                      String password = _signPassword.text;
                      dynamic status = await user.signIn(email, password);
                      if (status != "Failed") {
                        await AuthManager().setLoggedIn(true);
                        Navigator.pushNamed(context, "Base");
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(
                            iconPositionLeft: 4.0,
                            backgroundColor: Color(0xff1495ff),
                            message: "Welcome to MoneAge!",
                          ),
                        );
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(
                            iconPositionLeft: 4.0,
                            icon: Icon(
                              Icons.report_gmailerrorred_outlined,
                              color: Color(0x15000000),
                              size: 120.0,
                            ),
                            backgroundColor: Color(0xffff143f),
                            message: "Invalid Credentials",
                          ),
                        );
                      }
                    } else {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(
                          iconPositionLeft: 4.0,
                          icon: Icon(
                            Icons.report_gmailerrorred_outlined,
                            color: Color(0x15000000),
                            size: 120.0,
                          ),
                          backgroundColor: Color(0xffff143f),
                          message: "No Internet Connection",
                        ),
                      );
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 26.40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account ? ",
                    style: TextStyle(
                      color: Color(0xffA1A5B7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "Sign Up",
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xff1F7F8B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
