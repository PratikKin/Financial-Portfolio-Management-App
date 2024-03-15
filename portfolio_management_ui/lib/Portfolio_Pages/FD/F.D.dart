import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:mone_age/Portfolio_Pages/FD/Calculator/FD_Calculator.dart';

import '../../Features/selectBottomSheet.dart';
import 'addFD.dart';

class FD extends StatefulWidget {
  const FD({super.key});

  @override
  State<FD> createState() => _FDState();
}

class _FDState extends State<FD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (FD_List.isEmpty)
          ? Center(
              child: Text(
                "No F.D. Recorded!",
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: FD_List,
            ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandableFab(
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
                showAddPortfolio(context, 0);
              },
            ),
            FloatingActionButton.small(
              heroTag: null,
              child: const Icon(Icons.calculate_outlined),
              onPressed: () {
                showFDCalculator(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
