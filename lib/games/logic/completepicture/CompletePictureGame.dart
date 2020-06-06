
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/completepicture/Data.dart';

class CompletePictureGame extends StatefulWidget {
  @override
  _CompletePictureGameState createState() => _CompletePictureGameState();
}

class _CompletePictureGameState extends State<CompletePictureGame> {
  List<CardForPic> _dataShuffled;
  List<CardForPic> _data;
  int _random;
  List<bool> _rightPosition;
  bool _isDone;

  void _restart() {
    _isDone = false;
    _random = Random().nextInt(animals.length);
    _dataShuffled = getData(_random);
    _data = getData(_random);
    _dataShuffled.shuffle();
    _rightPosition = [false, false, false, false];
  }

  @override
  void initState() {
    _restart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isDone
          ? Container(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _restart();
                      });
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
                        "Replay",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              child: Row(children: [
                Column(
                  children: _dataShuffled
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: _rightPosition[e.position]
                                ? Container(
                                    width: 100,
                                  )
                                : Draggable<CardForPic>(
                                    data: e,
                                    child: e.element,
                                    childWhenDragging: Container(
                                      height: 100,
                                    ),
                                    feedback: e.element,
                                  ),
                          ))
                      .toList(),
                ),
                Container(
                  width: 250,
                  height: 250,
                  child: Wrap(
                      children: _data
                          .map(
                            (e) => DragTarget<CardForPic>(
                                builder: (BuildContext context, List incoming,
                                        List rejected) =>
                                    _rightPosition[e.position] == true
                                        ? Container(
                                            child: e.element,
                                          )
                                        : Container(
                                            height: 100,
                                            width: 100,
                                            color: Colors.lightBlueAccent,
                                          ),
                                onWillAccept: (data) =>
                                    data.position == e.position,
                                onAccept: (e) => {
                                      setState(() {
                                        _rightPosition[e.position] = true;
                                        print('ture');
                                        if (_rightPosition
                                            .every((element) => element )) {
                                          _isDone = true;
                                        }
                                      })
                                    }),
                          )
                          .toList()),
                )
              ]),
            ),
    );
  }
}
