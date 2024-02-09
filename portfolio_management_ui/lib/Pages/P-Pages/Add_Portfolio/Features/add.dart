import 'package:flutter/material.dart';

import '../F.D./AddFD.dart';
import '../R.E./AddRE.dart';
import '../Stocks/AddStocks.dart';

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
        child: _getBody(index),
      );
    },
    useSafeArea: true,
    isScrollControlled: true,
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
      return AddFD();
    case 1:
      return AddStocks();
    case 2:
      return AddRI();
    default:
      return Container(
        child: Text(
          "Unable to load pages!",
        ),
      );
  }
}
