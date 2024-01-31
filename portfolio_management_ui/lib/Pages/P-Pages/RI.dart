import 'package:flutter/material.dart';

import 'Add Porfolio/add.dart';

class RI_Pages extends StatefulWidget {
  const RI_Pages({super.key});

  @override
  State<RI_Pages> createState() => _RI_PagesState();
}

class _RI_PagesState extends State<RI_Pages> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            'Real Estate Content',
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              showAddPortfolio(context, 2);
            },
            backgroundColor: Color(0xff0F37AD),
            child: Icon(
              Icons.add,
              size: 40.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
