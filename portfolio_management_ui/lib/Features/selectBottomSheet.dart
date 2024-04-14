import 'package:flutter/material.dart';

import '/Portfolio_Pages/FD/addFD.dart';
import '/Portfolio_Pages/Real%20Estate/addRE.dart';
import '/Portfolio_Pages/Stocks/addStocks.dart';

void showAddPortfolio(BuildContext ctx, int index) {
  showModalBottomSheet(
    context: ctx,
    builder: (_) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        height: MediaQuery.of(ctx).size.height * 0.9,
        child: _getBody(index), // Pass the refresh callback
      );
    },
    useSafeArea: true,
    isScrollControlled: true,
    useRootNavigator: true,
    clipBehavior:
        Clip.antiAliasWithSaveLayer, // Clip the content to rounded corners
  );
}

Widget _getBody(int index) {
  // 0 => Add F.D.
  // 1 => Add Stocks
  // 2 => Add R.I.
  switch (index) {
    case 0:
      return addFD();
    case 1:
      return addStocks();
    case 2:
      return addRE();
    default:
      return Container(
        child: Text(
          "Unable to load pages!",
        ),
      );
  }
}
