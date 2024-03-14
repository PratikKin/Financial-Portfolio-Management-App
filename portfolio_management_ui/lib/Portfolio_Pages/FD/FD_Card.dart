import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

Widget FD_Card(
    BuildContext context, String title, String subtitle, Function()? onTap) {
  return GlassContainer(
    color: Colors.transparent,
    height: 210,
    width: MediaQuery.of(context).size.width * 0.45,
    gradient: LinearGradient(
      colors: [Colors.white.withOpacity(0.40), Colors.black.withOpacity(0.10)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderGradient: LinearGradient(
      colors: [
        Colors.black.withOpacity(0.60),
        Colors.black.withOpacity(0.10),
        Colors.grey.withOpacity(0.05),
        Colors.grey.withOpacity(0.6)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 0.39, 0.40, 1.0],
    ),
    borderColor: Colors.transparent,
    borderRadius: BorderRadius.circular(20.0),
    blur: 15.0,
    borderWidth: 1.5,
    elevation: 3.0,
    // isFrostedGlass: true,
    shadowColor: Colors.black.withOpacity(0.20),
    alignment: Alignment.center,
    frostedOpacity: 0.4,
    margin: EdgeInsets.all(8.0),
    padding: EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 20.0,
        ),
        Text(title),
        Text(subtitle),
      ],
    ),
  );
}
