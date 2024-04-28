import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:mone_age/Backend/FD.dart';
import 'package:mone_age/Portfolio_Pages/FD/Calculator/FD_Calculator.dart';
import 'package:mone_age/Portfolio_Pages/FD/Components/FD_Card.dart';

import '../../Features/selectBottomSheet.dart';

ValueNotifier<List<Widget>> FD_List = ValueNotifier<List<Widget>>([]);

class FD extends StatefulWidget {
  const FD({Key? key});

  @override
  State<FD> createState() => _FDState();
}

class _FDState extends State<FD> {
  late StreamController _controller;
  late StreamSubscription _subscription;

  FixedDeposit fd = FixedDeposit();
  dynamic Fdata = null;

  @override
  void initState() {
    super.initState();
    _controller = StreamController.broadcast();
    _subscription = _controller.stream.listen((_) {
      if (mounted) {
        setState(() {});
      }
    });

    initializedata();
  }

  Future<void> initializedata() async {
    startRefreshing();
    Fdata = await fd.getAllFD();
    updateList();
  }

  void updateList() {
    if (Fdata != null) {
      FD_List.value.clear();
      dynamic d = Fdata["data"];
      for (int i = 0; i < d.length; i++) {
        FD_List.value.add(
          FD_Card(
            FD_Name: d[i]['fdName'].toString(),
            Bank_Name: d[i]['bankName'].toString(),
            InvestedAmt: d[i]['amountdeposited'],
            increment: d[i]['IR'],
            frequency: d[i]['fdType'],
            investDate: d[i]['investedDate'].substring(0, 10),
            totalReturn: d[i]['totalAmount'],
            matureDate: d[i]['maturityDate'].substring(0, 10),
            notes: d[i]['notes'],
            fdId: d[i]['_id'],
          ),
        );
        FD_List.value = List.from(FD_List.value);
      }
    }
  }

  void startRefreshing() {
    Timer.periodic(Duration(microseconds: 100), (timer) {
      _controller.add(null); // Add an event to the stream
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (FD_List.value.isEmpty)
          ? Center(
              child: Text(
                "No F.D. Recorded!",
              ),
            )
          : ListView.builder(
              itemCount: FD_List.value.length,
              itemBuilder: (BuildContext context, int index) {
                return FD_List.value[index];
              },
            ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpandableFab(
          duration: Duration(milliseconds: 500),
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

                _controller.add(null);
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
