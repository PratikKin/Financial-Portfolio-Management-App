import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              ),
              const SizedBox(
                height: 26.40,
              ),
              TextFieldSignUp(
                controller: _email,
                iconUsed: CupertinoIcons.mail,
                hintText: 'Email',
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
                  onPressed: () {
                    Navigator.pushNamed(context, "Base");
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
                          "SignUp",
                        );
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xff1F7F8B),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
