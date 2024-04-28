import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:mone_age/Backend/FD.dart';
import 'package:mone_age/Portfolio_Pages/Portfolio%20Components/addButton.dart';
import 'package:mone_age/Portfolio_Pages/Portfolio%20Components/addPortfolioDates.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../Portfolio Components/addPortFolioTextFields.dart';
import 'Components/FD_Card.dart';
import 'F.D.dart';

class addFD extends StatefulWidget {
  const addFD({super.key});

  @override
  State<addFD> createState() => _addFDState();
}

class _addFDState extends State<addFD> {
  TextEditingController _fdName = TextEditingController();
  TextEditingController _bankName = TextEditingController();
  TextEditingController _amtDeposited = TextEditingController();
  TextEditingController _interestRate = TextEditingController();
  TextEditingController _investDate = TextEditingController();
  TextEditingController _maturityDate = TextEditingController();
  TextEditingController _notes = TextEditingController();
  bool isTap = false;

  FixedDeposit fd = FixedDeposit();

  @override
  void dispose() {
    // TODO: implement dispose
    _fdName.dispose();
    _bankName.dispose();
    _amtDeposited.dispose();
    _interestRate.dispose();
    _investDate.dispose();
    _maturityDate.dispose();
    _notes.dispose();
    super.dispose();
  }

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
          investDate: dataList[i]['investedDate'].substring(0, 10),
          totalReturn: dataList[i]['totalAmount'],
          matureDate: dataList[i]['maturityDate'].substring(0, 10),
          notes: dataList[i]['notes'],
          fdId: dataList[i]['_id'],
        ));
      }
      FD_List.value = List.from(FD_List.value);
    }
  }

  final today = DateUtils.dateOnly(DateTime.now());
  DropListModel dropListModel = DropListModel([
    OptionItem(id: "1", title: "Select Frequency"),
    OptionItem(id: "2", title: "Monthly"),
    OptionItem(id: "3", title: "Quarterly"),
    OptionItem(id: "4", title: "Yearly"),
  ]);
  OptionItem optionItemSelected = OptionItem(title: "Select Frequency");

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
                color: Colors.white,
              ),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              returnTextField(
                  _fdName, "Enter F.D. Name", TextInputType.text, 0.0),
              SizedBox(height: 20),
              returnTextField(
                  _bankName, "Enter Bank Name", TextInputType.text, 0.0),
              SizedBox(height: 20),
              returnTextField(_amtDeposited, "Enter Amount Deposited",
                  TextInputType.number, 0.0),
              SizedBox(height: 20),
              returnTextField(_interestRate, "Interest Rate",
                  TextInputType.numberWithOptions(decimal: true), 0.0),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: returnDateField(
                      controller: _investDate,
                      hintText: "Invested Date",
                      textInputType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: returnDateField(
                      controller: _maturityDate,
                      hintText: "Maturity Date",
                      textInputType: TextInputType.datetime,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SelectDropList(
                arrowColor: Colors.white38,
                shadowColor: Colors.white38,
                dropboxColor: Color(0xFF121212),
                textColorItem: Colors.white38,
                textColorTitle: Colors.white38,
                itemSelected: optionItemSelected,
                dropListModel: dropListModel,
                showIcon: false,
                showArrowIcon: true,
                showBorder: true,
                paddingTop: 0,
                paddingDropItem: const EdgeInsets.only(
                    left: 20, top: 10, bottom: 10, right: 20),
                suffixIcon: Icons.arrow_drop_down,
                containerPadding: const EdgeInsets.all(10),
                icon: const Icon(Icons.person, color: Colors.white38),
                onOptionSelected: (optionItem) {
                  optionItemSelected = optionItem;
                  setState(() {});
                },
                containerDecoration: BoxDecoration(
                  color: Color(0xff121212),
                  border: Border.all(color: Colors.white38),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              // SizedBox(height: 20),
              returnTextField(_notes, "Notes", TextInputType.multiline, 100),
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
              ),
              SizedBox(
                height: 20,
              ),
              addButton(
                () async {
                  bool status = await fd.createFD(
                    _fdName.text,
                    _bankName.text,
                    optionItemSelected.title,
                    int.parse(_amtDeposited.text),
                    double.parse(_interestRate.text),
                    _investDate.text,
                    _maturityDate.text,
                    _notes.text,
                  );

                  if (status != false) {
                    FD_List.value.clear();
                    dynamic data = await fd.getAllFD();

                    updateList(data);

                    Navigator.of(context).pop();
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'FD Created Successfully!',
                    );
                  }
                },
                "Add F.D.",
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
