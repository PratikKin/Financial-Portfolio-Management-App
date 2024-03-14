import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final IconData iconUsed;
  final String hintText;
  final bool obscureText;
  const PasswordField({
    Key? key, // Corrected the key parameter
    required this.controller,
    required this.iconUsed,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool _obscureText = widget.obscureText;

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
          suffixIcon: IconButton(
            icon: Icon(
              (!_obscureText) ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
              color: Color(0xff5E6278),
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
        obscureText: _obscureText,
      ),
    );
  }
}
