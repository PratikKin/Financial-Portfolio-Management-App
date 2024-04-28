import 'package:flutter/material.dart';

Widget returnTextField(TextEditingController _controller, String hintText,
    TextInputType textInputType, double? height) {
  return Container(
    height: (height! > 0.0) ? height : 50.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: Colors.white38),
    ),
    padding: EdgeInsets.symmetric(horizontal: 18.0),
    child: TextField(
      keyboardType: textInputType,
      controller: _controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        iconColor: Colors.white,
        hintStyle: TextStyle(color: Colors.white38),
        hintText: hintText,
      ),
    ),
  );
}
