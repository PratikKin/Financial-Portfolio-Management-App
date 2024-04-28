import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ComponentCards(IconData icon, String cardName) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        children: [
          Icon(
            icon,
            size: 28.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            cardName,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
      Icon(
        CupertinoIcons.chevron_right,
        color: Colors.white,
      ),
    ],
  );
}
