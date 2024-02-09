import 'package:flutter/material.dart';

class AddStocks extends StatefulWidget {
  const AddStocks({super.key});

  @override
  State<AddStocks> createState() => _AddStocksState();
}

class _AddStocksState extends State<AddStocks> {
  TextEditingController _stockName = TextEditingController();
  TextEditingController _quantityBought = TextEditingController();
  TextEditingController _amtInvested = TextEditingController();
  TextEditingController _investDate = TextEditingController();
  TextEditingController _notes = TextEditingController();

  bool isTap = false;
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
              style: TextStyle(color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                setState(() {});
              },
              child: Icon(
                Icons.close,
                color: Colors.black,
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
              _returnTextField(_stockName, 'Stock Name'),
              SizedBox(height: 20),
              _returnTextField(_quantityBought, 'Quantity Bought'),
              SizedBox(height: 20),
              _returnTextField(_amtInvested, 'Amount Invested'),
              SizedBox(height: 20),
              _returnTextField(_investDate, 'Invested Date'),
              SizedBox(height: 20),
              _returnTextField(_notes, 'Notes'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notify Me."),
                  Switch(
                    activeColor: Color(0xff0F37AD),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _returnTextField(TextEditingController _controller, String hintText) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: Colors.black),
    ),
    padding: EdgeInsets.symmetric(horizontal: 18.0),
    child: TextField(
      controller: _controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
      ),
    ),
  );
}
