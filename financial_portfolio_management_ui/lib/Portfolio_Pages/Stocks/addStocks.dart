import 'package:flutter/material.dart';

import '../Portfolio Components/addButton.dart';
import '../Portfolio Components/addPortFolioTextFields.dart';

class addStocks extends StatefulWidget {
  const addStocks({super.key});

  @override
  State<addStocks> createState() => _addStocksState();
}

class _addStocksState extends State<addStocks> {
  final TextEditingController _stockName = TextEditingController();
  final TextEditingController _stockSym = TextEditingController();
  final TextEditingController _quantityBought = TextEditingController();
  final TextEditingController _amtInvested = TextEditingController();
  final TextEditingController _investDate = TextEditingController();
  final TextEditingController _notes = TextEditingController();

  bool isTap = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _stockName.dispose();
    _stockSym.dispose();
    _quantityBought.dispose();
    _amtInvested.dispose();
    _investDate.dispose();
    _notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Add New Stocks',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                setState(() {});
              },
              child: Icon(
                Icons.close,
                color: Colors.white60,
              ),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              SizedBox(height: 20),
              returnTextField(
                  _stockName, 'Stock Name', TextInputType.text, 0.0),
              SizedBox(height: 20),
              returnTextField(
                  _stockSym, 'Stock Symbol', TextInputType.text, 0.0),
              SizedBox(height: 20),
              returnTextField(_quantityBought, 'Quantity Bought',
                  TextInputType.numberWithOptions(decimal: true), 0.0),
              SizedBox(height: 20),
              returnTextField(_amtInvested, 'Amount Invested',
                  TextInputType.numberWithOptions(decimal: true), 0.0),
              SizedBox(height: 20),
              returnTextField(
                  _investDate, 'Invested Date', TextInputType.datetime, 0.0),
              SizedBox(height: 20),
              returnTextField(_notes, 'Notes', TextInputType.multiline, 100),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notify Me.",
                    style: TextStyle(color: Colors.white38),
                  ),
                  Switch(
                    inactiveThumbColor: Colors.white38,
                    activeColor: Color(0xff0fad6b),
                    value: isTap,
                    onChanged: (value) {
                      setState(
                        () {
                          isTap = value;
                        },
                      );
                    },
                  ),
                ],
              ),
              addButton(
                () {
                  setState(
                    () {
                      // Stocks_List.value.add(
                      //   stocksCard(
                      //     _stockName.text,
                      //     _stockSym.text,
                      //     _amtInvested.text,
                      //     // data of interest rate is to be fetched from backend
                      //     () {},
                      //   ),
                      // );
                      // Stocks_List.value = List.from(Stocks_List.value);
                    },
                  );
                  Navigator.of(context).pop();
                },
                "Add F.D.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
