import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsapp/games/logic/completepicture/Data.dart';
import 'package:kidsapp/models/lightbulbprogress/ProgressBarStar.dart';
import 'package:provider/provider.dart';

import 'ComletePicture.dart';

class CompletePictureGameRound extends StatefulWidget {
  @override
  _CompletePictureGameRoundState createState() => _CompletePictureGameRoundState();
}

class _CompletePictureGameRoundState extends State<CompletePictureGameRound> {
  List<CardForPic> _dataShuffled;
  List<CardForPic> _data;
  int _random;
  List<bool> _rightPosition;
  

  @override
  void initState() {
    _random = Random().nextInt(animals.length);
    _dataShuffled = getData(_random);
    _data = getData(_random);
    _dataShuffled.shuffle();
    _rightPosition = [false, false, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: Alignment.center,
              child: Wrap(children: [
                Column(
                  children: _dataShuffled
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: _rightPosition[e.position]
                                ? Container(
                                    width: 100,
                                    height: 100,
                                  )
                                : Draggable<CardForPic>(
                                    data: e,
                                    child: e.element,
                                    childWhenDragging: Container(
                                      height: 100,
                                      width: 100,
                                    ),
                                    feedback: e.element,
                                  ),
                          ))
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:5,left: 5),
                  child: Stack(
                    children: [
                      Container(
                        width: 235,
                        height: 235,
                        child: SvgPicture.asset("assets/logic/completepic/completepic-frame.svg",fit: BoxFit.fill,),
                      ),
                      Positioned(
                        top: 17.5,
                        left: 17.5,
                        child: Container(
                          width: 200,
                          height: 200,
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
//                                                  color: Colors.lightBlueAccent,
                                                ),
                                      onWillAccept: (data) =>
                                          data.position == e.position,
                                      onAccept: (e) => {
                                            setState(() {
                                              _rightPosition[e.position] = true;
                                              print('ture');
                                              if (_rightPosition
                                                  .every((element) => element)) {
                                                   CompletePictureState().nextRound();
                                                   Provider.of<ProgressBarStarData>(context, listen: false).finishRound();
                                              }
                                            })
                                          }),
                                )
                                .toList()),
                    ),
                      ),]
                  ),
                )
              ]),
    );
  }
}
