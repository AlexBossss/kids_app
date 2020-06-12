import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Data.dart';
import 'WhatSuitsGame.dart';

class WhatSuitsRound extends StatefulWidget {
  @override
  _WhatSuitsRoundState createState() => _WhatSuitsRoundState();
}


class _WhatSuitsRoundState extends State<WhatSuitsRound> {
  List<String> _data;
  String _searchItem;
  bool _isDone;
  List<bool> elementState = [false, false, false, false];
  List <List<String>> _figures =[
    getStarsData(),
    getCurvedData(),
    getCurvedStarsData(),
    getKeysData(),
    getPuzzlesData()
  ];
  Color _itemColor;

  @override
  void initState() {
    _itemColor = colors[Random().nextInt(colors.length)];
    _isDone = false;
    _data = _figures[Random().nextInt(_figures.length)];
    _searchItem = _data[Random().nextInt(_data.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          color: _itemColor,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: DragTarget<String>(
                onWillAccept: (data) => data == _searchItem,
                onAccept: (e) {
                  setState(() {
                    _isDone = true;
                    elementState[_data.indexOf(e)] = true;
                  });
                  WhatSuitsGameState().nextRound();
                },
                builder: (BuildContext context, List incoming, List rejected) {
                  return _isDone
                      ? Container()
                      : Container(
                          child: SvgPicture.asset(
                            _searchItem,
                            color: Colors.white,
                          ),
                        );
                }),
          ),
        ),
        Center(
          child: Wrap(
            children: _data
                .map((e) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Draggable<String>(
                        data: e,
                        childWhenDragging: Container(
                          width: 120,
                          height: 120,
                        ),
                        feedback: Container(
                          height: 120,
                          width: 120,
                          child: SvgPicture.asset(e, color: _itemColor),
                        ),
                        child: elementState[_data.indexOf(e)]

                            ? Container(
                                height: 120,
                                width: 120,
                              )
                            : Container(
                                height: 120,
                                width: 120,
                                child: SvgPicture.asset(e, color: _itemColor),
                              ),
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
