import 'package:flutter/material.dart';

import 'Add Porfolio/add.dart';

/*
Widget _buildFDListTile(String title, String subtitle, Function()? onTap) {
  return ListTile(
    title: Text(title, style: TextStyle(color: Colors.white)),
    subtitle: Text(subtitle),
    onTap: onTap,
  );
}
*/
class FD_pages extends StatefulWidget {
  const FD_pages({Key? key}) : super(key: key);

  @override
  State<FD_pages> createState() => _FD_pagesState();
}

class _FD_pagesState extends State<FD_pages> {
  List<Widget> FD_List = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: (FD_List.isEmpty)
              ? [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No F.D. Recorded!",
                        ),
                      ],
                    ),
                  ),
                ]
              : FD_List,
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              showAddPortfolio(context, 0);
            },
            backgroundColor: Color(0xff0F37AD),
            child: Icon(
              Icons.add,
              size: 40.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
