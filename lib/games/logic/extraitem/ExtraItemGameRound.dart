import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/extraitem/Data.dart';
import 'Item.dart';

class ExtraItemGameRound extends StatelessWidget {
  final List<Item> _data = getShapeData();
  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
          alignment: Alignment.center,
          height:  MediaQuery.of(context).size.height / 1.5,
          child:
              Container(
                alignment: Alignment.center,
                width: 300,
                child: Wrap(
                  children: _data
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.all(10),
                          height: 110,
                          width: 110,
                          child: e,
                        ),
                      )
                      .toList(),
                ),
              ),
        ),
    );
  }
}
