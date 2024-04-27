import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mone_age/Backend/FD.dart';
import 'package:mone_age/Portfolio_Pages/FD/Components/fdPageComponent.dart';
import 'package:mone_age/Portfolio_Pages/FD/Components/updateFD.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../F.D.dart';
import 'FD_Card.dart';

class FDCardPage extends StatefulWidget {
  final String fdId;
  final String fdName;
  final String bankName;
  final int investedAmt;
  final double interestRate;
  final String investDate;
  final String matureDate;
  final String frequency;
  final double totalAmt;
  final String notes;

  const FDCardPage(
      {super.key,
      required this.bankName,
      required this.investedAmt,
      required this.interestRate,
      required this.investDate,
      required this.matureDate,
      required this.frequency,
      required this.totalAmt,
      required this.fdName,
      required this.fdId,
      required this.notes});

  @override
  State<FDCardPage> createState() => _FDCardPageState();
}

class _FDCardPageState extends State<FDCardPage> {
  FixedDeposit fd = FixedDeposit();
  bool success = false;

  void updateList(dynamic dataD) {
    if (dataD != null && dataD['data'] is List) {
      List<dynamic> dataList = dataD['data'];
      for (int i = 0; i < dataList.length; i++) {
        FD_List.value.add(FD_Card(
          frequency: dataList[i]['fdType'],
          FD_Name: dataList[i]['fdName'],
          Bank_Name: dataList[i]['bankName'],
          InvestedAmt: dataList[i]['amountdeposited'],
          increment: dataList[i]['IR'],
          investDate: dataList[i]['investedDate'],
          totalReturn: dataList[i]['totalAmount'],
          matureDate: dataList[i]['maturityDate'],
          notes: dataList[i]['notes'],
          fdId: dataList[i]['_id'],
        ));
      }
      FD_List.value = List.from(FD_List.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c242e),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.chevron_back),
        ),
        title: Text("${widget.fdName}"),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
              color: Color(0xFF333333),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(16.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                fdComponent("FD. Name", widget.fdName),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    thickness: 0.4,
                    color: Colors.grey,
                  ),
                ),
                fdComponent("Bank Name", widget.bankName),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    thickness: 0.4,
                    color: Colors.grey,
                  ),
                ),
                fdComponent("Invested Amount", "${widget.investedAmt}"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    thickness: 0.4,
                    color: Colors.grey,
                  ),
                ),
                fdComponent("Interest Rate", "${widget.interestRate}%"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    thickness: 0.4,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: fdComponent("Invested Date",
                          "${widget.investDate.substring(0, 10)}"),
                    ),
                    Container(
                      width: 0.5,
                      height: 50,
                      color: Colors.grey,
                    ),
                    Expanded(
                        child: fdComponent("Maturity Date",
                            "${widget.matureDate.substring(0, 10)}")),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    thickness: 0.4,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    fdComponent("Frequency", "${widget.frequency}"),
                    Container(
                      width: 0.5,
                      height: 50,
                      color: Colors.grey,
                    ),
                    fdComponent("Total Return", "${widget.totalAmt}"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                showUpdateFD(
                    context,
                    widget.fdId,
                    widget.fdName,
                    widget.bankName,
                    widget.investedAmt,
                    widget.interestRate,
                    widget.investDate,
                    widget.matureDate,
                    widget.notes);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 52,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff377c77).withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Color(0xff265250),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  CupertinoIcons.pencil_outline,
                  size: 24.0,
                  color: Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                success = await fd.deleteFD(widget.fdId);

                if (success == true) {
                  FD_List.value.clear();
                  dynamic data = await fd.getAllFD();
                  updateList(data);
                  Navigator.pop(context);
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'FD Deleted Successfully!',
                  );
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 52,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff8f3a23).withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Color(0xff561808),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  CupertinoIcons.bin_xmark,
                  size: 24.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
