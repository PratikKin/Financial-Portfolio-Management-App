import 'package:flutter/material.dart';
import 'package:portfolio_management_ui/Pages/P-Pages/Add_Portfolio/Features/add.dart';

class Stock_Pages extends StatefulWidget {
  const Stock_Pages({Key? key}) : super(key: key);

  @override
  State<Stock_Pages> createState() => _Stock_PagesState();
}

class _Stock_PagesState extends State<Stock_Pages> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            'Stocks Content',
          ),
        ),
        Positioned(
          bottom: 16.0, // Adjust the position of the button as needed
          right: 16.0, // Adjust the position of the button as needed
          child: FloatingActionButton(
            onPressed: () {
              showAddPortfolio(context, 1);
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
