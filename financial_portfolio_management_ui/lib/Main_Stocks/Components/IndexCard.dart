import 'package:flutter/material.dart';

class IndexCard extends StatefulWidget {
  final String name;
  final String symbol;
  final String price;
  final String change;
  const IndexCard(
      {super.key,
      required this.name,
      required this.symbol,
      required this.price,
      required this.change});

  @override
  State<IndexCard> createState() => _IndexCardState();
}

class _IndexCardState extends State<IndexCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
            color: Colors.white10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    widget.symbol,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.price,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "${widget.change}%",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
