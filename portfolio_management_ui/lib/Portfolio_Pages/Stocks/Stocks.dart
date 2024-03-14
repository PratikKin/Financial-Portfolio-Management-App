import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../Features/selectBottomSheet.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("No Stocks Recorded!"),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        type: ExpandableFabType.up,
        distance: 70.0,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            child: Container(
              child: Icon(
                Icons.add,
              ),
            ),
            onPressed: () {
              showAddPortfolio(context, 1);
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.calculate_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
