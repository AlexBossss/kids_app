import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsapp/games/attentiongames/whatsuits/FinishedItem.dart';
import 'package:kidsapp/games/attentiongames/whatsuits/WhatSuitsItem.dart';
import 'package:kidsapp/models/lightbulbprogress/ProgressBarStar.dart';
import 'package:provider/provider.dart';

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
  List<bool> elementState = [false, false, false];
  List<List<String>> _figures = [
    getStarsData(),
    getCurvedData(),
    getCurvedStarsData(),
    getKeysData(),
    getPuzzlesData()
  ];
  Color _itemColor;
  double _topPaddingPercent;

  @override
  void initState() {
    _itemColor = colors[Random().nextInt(colors.length)];
    _isDone = false;
    _data = _figures[Random().nextInt(_figures.length)];
    _searchItem = _data[Random().nextInt(_data.length)];
    _topPaddingPercent = 0.23;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: screenHeight * _topPaddingPercent,
          ),
          Container(
            width: 400,
            child: Wrap(
              children: _data
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Draggable<String>(
                          data: e,
                          childWhenDragging: Container(
                            width: 100,
                            height: 100,
                          ),
                          feedback: Container(
                            height: 100,
                            width: 100,
                            child: SvgPicture.asset(e, color: _itemColor),
                          ),
                          child: elementState[_data.indexOf(e)]
                              ? Container(
                                  height: 100,
                                  width: 100,
                                )
                              : WhatSuitsItem(e, _itemColor),
                        ),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 180,
            height: 180,
            child: Stack(children: [
              Container(
                width: 180,
                height: 180,
                child: SvgPicture.asset(
                  'assets/attentiongame/whatsuits/TV.svg',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 40),
                  child: DragTarget<String>(
                      onWillAccept: (data) => data == _searchItem,
                      onAccept: (e) {
                        setState(() {
                          _isDone = true;
                          elementState[_data.indexOf(e)] = true;
                        });
                        WhatSuitsGameState().nextRound();
                        Provider.of<ProgressBarStarData>(context, listen: false)
                            .finishRound();
                      },
                      builder:
                          (BuildContext context, List incoming, List rejected) {
                        return _isDone
                            ? Container(
                                child: FinishedItem(_searchItem, _itemColor))
                            : Container(
                                child: SvgPicture.asset(
                                  _searchItem,
                                  width: 100,
                                  height: 100,
                                  color: Colors.white,
                                ),
                              );
                      })),
            ]),
          ),
        ],
      ),
    );
  }
}
