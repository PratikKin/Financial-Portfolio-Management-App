import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mone_age/Backend/Authentication.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../Components/PasswordField.dart';
import '../Components/TextFieldSignUp.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool _obscureText = true;
  bool _obscureTextCnf = true;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Authentication user = Authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0.0,
        title: const Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Color(0xff1F7F8B),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/user_signup.png",
                  height: 200.0,
                  width: 200.0,
                ),
              ),
              const Text(
                "Create account and enjoy all services",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 26.40,
              ),
              TextFieldSignUp(
                controller: _name,
                iconUsed: CupertinoIcons.person,
                hintText: 'Full Name',
                keyBoard: TextInputType.text,
              ),
              const SizedBox(
                height: 26.40,
              ),
              TextFieldSignUp(
                controller: _email,
                iconUsed: CupertinoIcons.mail,
                hintText: 'Email',
                keyBoard: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 26.40,
              ),
              PasswordField(
                controller: _password,
                iconUsed: CupertinoIcons.lock,
                hintText: "Password",
                obscureText: _obscureText,
              ),
              const SizedBox(
                height: 26.40,
              ),
              PasswordField(
                controller: _confirmPassword,
                iconUsed: CupertinoIcons.lock,
                hintText: "Confirm Password",
                obscureText: _obscureTextCnf,
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
                    String name = "";
                    String email = "";
                    String password = "";

                    setState(() {
                      name = _name.text;
                      email = _email.text;
                      password = _password.text;
                    });

                    if (_password.text == _confirmPassword.text) {
                      print(name + " " + email + " " + password);
                      dynamic status = await user.signUp(name, email, password);
                      if (status != "Failed") {
                        // Navigator.pushNamed(context, "Base");
                        showTopSnackBar(
                          Overlay.of(context),
                          CustomSnackBar.success(
                            iconPositionLeft: 4.0,
                            backgroundColor: Color(0xff14ff66),
                            message: "Check Email and Verify!",
                          ),
                        );
                        setState(
                          () {
                            _name.clear();
                            _email.clear();
                            _password.clear();
                            _confirmPassword.clear();
                          },
                        );
                      } else
                        print("Failed with some error");
                    } else {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          iconPositionLeft: 4.0,
                          icon: Icon(
                            Icons.report_gmailerrorred_outlined,
                            size: 60.0,
                          ),
                          backgroundColor: Color(0xffff143f).withOpacity(0.3),
                          message: "Invalid Entries!",
                        ),
                      );
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Sign Up",
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
                    "Already have an account ? ",
                    style: TextStyle(
                      color: Color(0xffA1A5B7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "SignIn",
                      );
                    },
                    child: const Text(
                      "Sign In",
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
