import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GlassContainer(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.3,
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.40),
                Colors.blue.withOpacity(0.10)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.60),
                Colors.black.withOpacity(0.10),
                Colors.lightBlueAccent.withOpacity(0.05),
                Colors.lightBlueAccent.withOpacity(0.6)
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
            isFrostedGlass: true,
            shadowColor: Colors.black.withOpacity(0.20),
            alignment: Alignment.center,
            frostedOpacity: 0.12,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
          ),
        ],
      ),
    ));
  }
}
