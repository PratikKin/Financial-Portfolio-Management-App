import 'package:flutter/material.dart';

void showFDCalculator(BuildContext ctx) {
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
        height: MediaQuery.of(ctx).size.height * 0.6,
        child: FD_Calculator(), // Pass the refresh callback
      );
    },
    useSafeArea: true,
    isScrollControlled: true,
    clipBehavior:
        Clip.antiAliasWithSaveLayer, // Clip the content to rounded corners
  );
}

class FD_Calculator extends StatefulWidget {
  const FD_Calculator({Key? key}) : super(key: key);

  @override
  State<FD_Calculator> createState() => _FD_CalculatorState();
}

class _FD_CalculatorState extends State<FD_Calculator> {
  TextEditingController amount = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController interestRate = TextEditingController();

  double totalAmt = 0.0;
  String totalAmtText = '0.0';

  @override
  void dispose() {
    // TODO: implement dispose
    amount.dispose();
    duration.dispose();
    interestRate.dispose();
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
              'Add New F.D.',
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 26.40,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffB5B5C3)),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: amount,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Amount to be Deposited",
                    hintStyle: TextStyle(
                      color: Color(0xffA1A5B7),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0)),
              ),
            ),
            const SizedBox(
              height: 26.40,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffB5B5C3)),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: duration,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Duration (In Years)",
                    hintStyle: TextStyle(
                      color: Color(0xffA1A5B7),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0)),
              ),
            ),
            const SizedBox(
              height: 26.40,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffB5B5C3)),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: interestRate,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Interest Rate (in %)",
                    hintStyle: TextStyle(
                      color: Color(0xffA1A5B7),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0)),
              ),
            ),
            const SizedBox(
              height: 26.40,
            ),
            Container(
              alignment: Alignment.center,
              height: 48,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xff23213D)),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    calculateTotalValue();
                  });
                },
                child: const Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 26.40,
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.95,
              height: 48.0,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffB5B5C3)),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                totalAmtText,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateTotalAmtText() {
    setState(() {
      totalAmtText = totalAmt
          .toStringAsFixed(2); // Convert double to string with 2 decimal places
    });
  }

  void calculateTotalValue() {
    double incrementAmt = 0.0;

    double durationVal = double.parse(duration.text) * 12;

    incrementAmt = durationVal *
        double.parse(interestRate.text) *
        double.parse(amount.text) /
        100;

    totalAmt = incrementAmt + double.parse(amount.text);
    updateTotalAmtText();
  }
}
