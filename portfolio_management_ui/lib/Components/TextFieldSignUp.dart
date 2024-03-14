import 'package:flutter/material.dart';

class TextFieldSignUp extends StatefulWidget {
  final TextEditingController controller;
  final IconData iconUsed;
  final String hintText;
  const TextFieldSignUp({
    Key? key, // Corrected the key parameter
    required this.controller,
    required this.iconUsed,
    required this.hintText,
  }) : super(
            key: key); // Used super(key: key) to pass the key to the superclass

  @override
  State<TextFieldSignUp> createState() => _TextFieldSignUpState();
}

class _TextFieldSignUpState extends State<TextFieldSignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffB5B5C3)),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            widget.iconUsed,
            color: Color(0xff1F7F8B),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Color(0xffA1A5B7),
          ),
        ),
      ),
    );
  }
}
