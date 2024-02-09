import 'package:flutter/material.dart';

import '../Features/add.dart';

/*
Widget _buildFDListTile(String title, String subtitle, Function()? onTap) {
  return GlassContainer(
    height: 210,
    width: MediaQuery.of(context as BuildContext).size.width * 0.4,
    gradient: LinearGradient(
      colors: [
        Colors.blue.withOpacity(0.40),
        Colors.blue.withOpacity(0.10)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderGradient: LinearGradient(
      colors: [
        Colors.black.withOpacity(0.60),
        Colors.black.withOpacity(0.10),
        Colors.lightBlueAccent.withOpacity(0.05),
        Colors.lightBlueAccent.withOpacity(0.6)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 0.39, 0.40, 1.0],
    ),
    borderColor: Colors.transparent,
    borderRadius: BorderRadius.circular(20.0),
    blur: 15.0,
    borderWidth: 1.5,
    elevation: 3.0,
    isFrostedGlass: true,
    shadowColor: Colors.black.withOpacity(0.20),
    alignment: Alignment.center,
    frostedOpacity: 0.12,
    margin: EdgeInsets.all(8.0),
    padding: EdgeInsets.all(8.0),
    child: Column(
      children: [
        Text(title),
        Text(subtitle),
      ],
    ),
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
        (FD_List.isEmpty)
            ? Center(
                child: Text(
                  "No F.D. Recorded!",
                ),
              )
            : GridView.count(
                crossAxisCount: 2, // Number of columns
                children: FD_List,
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
