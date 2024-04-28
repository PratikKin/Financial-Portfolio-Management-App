import 'package:flutter/material.dart';

Widget fdComponent(String title, String subTitile) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(fontFamily: "Poppins-Thin"),
      ),
      Text(subTitile),
    ],
  );
}
