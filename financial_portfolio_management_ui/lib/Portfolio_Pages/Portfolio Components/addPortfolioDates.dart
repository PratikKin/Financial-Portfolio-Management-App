import 'package:flutter/material.dart';

class returnDateField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;

  const returnDateField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.textInputType});

  @override
  State<returnDateField> createState() => _returnDateFieldState();
}

class _returnDateFieldState extends State<returnDateField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.white38),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: TextField(
        keyboardType: widget.textInputType,
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          iconColor: Colors.white,
          hintStyle: TextStyle(color: Colors.white38),
          hintText: widget.hintText,
        ),
        readOnly: true,
        onTap: () {
          selectDateTime();
        },
      ),
    );
  }

  Future<void> selectDateTime() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  Colors.black,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (_picked != null) {
      setState(() {
        widget.controller.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
