import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RememberCardRound.dart';

class RememberCard extends StatefulWidget {
  @override
  RememberCardState createState() => RememberCardState();

}

class RememberCardState extends State<RememberCard> {
  static int index = 0;
  final List<Color> colors = [Color(0xFFF3D1FF), Color(0xFF93EBFF)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: RememberCardRound(amountOfSearchItems: 2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print(index);
            },
            child: Container(
              height: 50,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                "print",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
