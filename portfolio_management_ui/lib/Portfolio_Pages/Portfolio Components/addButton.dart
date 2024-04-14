import 'package:flutter/material.dart';

Widget addButton(VoidCallback onPressed, String text) {
  return TextButton(
    onPressed: onPressed,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.white),
          color: Colors.grey.withOpacity(0.3)),
      alignment: Alignment.center,
      height: 40.0,
      width: 120.0,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
