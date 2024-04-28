import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fdCardPage.dart';

class FD_Card extends StatefulWidget {
  final String fdId;
  final String FD_Name;
  final String Bank_Name;
  final int InvestedAmt;
  final double increment;
  final String investDate;
  final String matureDate;
  final String frequency;
  final double totalReturn;
  final String notes;

  const FD_Card({
    super.key,
    required this.FD_Name,
    required this.Bank_Name,
    required this.InvestedAmt,
    required this.increment,
    required this.investDate,
    required this.matureDate,
    required this.totalReturn,
    required this.notes,
    required this.frequency,
    required this.fdId,
  });

  @override
  State<FD_Card> createState() => _FD_CardState();
}

class _FD_CardState extends State<FD_Card> {
  Color c1 = Color(0xff132a3b);

  // Color c2 = Color(0xff14192d);
  Color c2 = Color(0xff103852);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FDCardPage(
                fdId: widget.fdId,
                fdName: widget.FD_Name,
                bankName: widget.Bank_Name,
                investedAmt: widget.InvestedAmt,
                interestRate: widget.increment,
                investDate: widget.investDate,
                matureDate: widget.matureDate,
                frequency: widget.frequency,
                totalAmt: widget.totalReturn,
                notes: widget.notes,
              ),
            ),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
                strokeAlign: BorderSide.strokeAlignInside,
                color: Color(0xff092096).withOpacity(0.3)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.mirror,
              colors: [
                c1, // Color(0xff133730),

                c2, // Color(0xff132c2b),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.FD_Name),
                    Text(
                      widget.Bank_Name,
                      style: TextStyle(
                        fontFamily: "Poppins-Thin",
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Color(0xff092096).withOpacity(0.3),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.mirror,
                      colors: [
                        c2, // Color(0xff132c2b),
                        c1, // Color(0xff133730),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.InvestedAmt}"),
                        Container(
                          // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28.0),
                            border: Border.all(
                              color: Color(0xff099658).withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                CupertinoIcons.arrow_up_right,
                                color: Colors.greenAccent,
                                size: 16.0,
                              ),
                              Text(
                                "${widget.increment}%",
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
