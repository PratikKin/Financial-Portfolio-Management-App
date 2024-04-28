import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../Features/selectBottomSheet.dart';

class RE extends StatefulWidget {
  const RE({super.key});

  @override
  State<RE> createState() => _REState();
}

class _REState extends State<RE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("No Real Estate Recorded!"),
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
              showAddPortfolio(context, 2);
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
