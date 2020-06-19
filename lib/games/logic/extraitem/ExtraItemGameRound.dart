import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/extraitem/Data.dart';
import 'Item.dart';

class ExtraItemGameRound extends StatelessWidget {
  final List<Item> _data = getShapeData();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Wrap(
            children: _data
                .map(
                  (e) => Container(
                    margin: EdgeInsets.all(20),
                    width: 100,
                    child: e,
                  ),
                )
                .toList(),

          ),
        ],
      ),
    );
  }
}
