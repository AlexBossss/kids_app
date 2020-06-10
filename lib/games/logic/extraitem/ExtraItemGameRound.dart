import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/extraitem/Data.dart';

import 'ExtraItemGame.dart';

class ExtraItemGameRound extends StatefulWidget {
  @override
  _ExtraItemGameRoundState createState() => _ExtraItemGameRoundState();
}

class _ExtraItemGameRoundState extends State<ExtraItemGameRound>
    with TickerProviderStateMixin {
  List _data;
  bool _isDone;

  List<List> itemGenerator = [
    getSameFiguresByColor(),
    getDifferentFiguresByColor(),
    getSameFiguresBySize(),
    getDifferentFiguresBySize(),
    getSameFiguresByShape(),
    getDifferentFiguresByShape(),
  ];

  @override
  void initState() {
    _isDone = false;
    _data = itemGenerator[Random().nextInt(itemGenerator.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 400,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
                children: _data
                    .map(
                      (e) => Container(
                        width: 150,
                        height: 200,
                        child: Container(
                          child: (e.getIsRight == true && _isDone)
                              ? Container()
                              : GestureDetector(
                                  onTap: () => {
                                    if (e.getIsRight == true)
                                      {
                                        print('ok'),
                                        setState(() {
                                          _isDone = true;
                                        }),
                                        ExtraItemGameState().nextRound(),
                                      }
                                  },
                                  child: CustomPaint(
                                    painter: e,
                                  ),
                                ),
                        ),
                      ),
                    )
                    .toList()),
          ),
        ),
      ),
    );
  }
}
