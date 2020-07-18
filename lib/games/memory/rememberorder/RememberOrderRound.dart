import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kidsapp/games/memory/rememberorder/Data.dart';

import 'Data.dart';
import 'RememberOrder.dart';

class RememberOrderRound extends StatefulWidget {
  final int orderLength;

  RememberOrderRound({this.orderLength});

  @override
  _RememberOrderRoundState createState() =>
      _RememberOrderRoundState(orderLength);
}

class _RememberOrderRoundState extends State<RememberOrderRound> {
  int _orderLength;
  List<OrderItem> _data;
  bool _isAction;
  Map _score = {};
  List<OrderItem> _shuffledData;
  bool _isHouseItemVisible;
  double _optionOpacity;
  Duration _isActionAnimationDuration = Duration(milliseconds: 500);
  double _startButtonHeight = 50;
  Color _windowColor = Colors.yellow[100];
  double _floorHeight = 0.18;
  double _groundHeight = 0.03;
  double _roofHeight = 0.085;
  double _bottomPadding = 120;

  _RememberOrderRoundState(this._orderLength);

  void showOptions() {
    Future.delayed(
        _isActionAnimationDuration,
        () => {
              setState(() {
                _optionOpacity = 1;
              })
            });
  }

  void startRound() {
    setState(() {
      _startButtonHeight = 0;
      _isHouseItemVisible = false;
    });
    Future.delayed(
        _isActionAnimationDuration,
        () => {
              setState(() {
                _isAction = true;
                showOptions();
              })
            });
  }

  List<Widget> getHouse(int floorAmount, double height) {
    double heightFloorPercent = _floorHeight;
    double firstFloorStart = _bottomPadding + height * _groundHeight;
    List<Widget> house = [
      Positioned(
        bottom: _bottomPadding,
        child: SvgPicture.asset(
          "assets/memorygame/whichismyfloor/ground.svg",
          alignment: Alignment.bottomCenter,
          height: height * _groundHeight,
        ),
      ),
    ];
    for (int i = 0; i < floorAmount; i++) {
      house.add(
        Positioned(
          bottom: firstFloorStart,
          child: Container(
            child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                color: _windowColor,
                width: 200,
                height: height * (heightFloorPercent - 0.01),
              ),
              AnimatedOpacity(
                duration: _isActionAnimationDuration,
                opacity: _isHouseItemVisible ? 1.0 : 0.0,
                child: Container(
                  height: 80,
                  child: Image.asset(_data[i].pic),
                ),
              ),
              SvgPicture.asset(
                "assets/memorygame/whichismyfloor/floor.svg",
                height: height * heightFloorPercent,
              ),
            ]),
          ),
        ),
      );
      firstFloorStart += height * (heightFloorPercent - 0.01);
    }
    house.add(
      Positioned(
        bottom: firstFloorStart,
        child: SvgPicture.asset(
          "assets/memorygame/whichismyfloor/roof.svg",
          alignment: Alignment.bottomCenter,
          height: height * _roofHeight,
        ),
      ),
    );
    return house;
  }

  List<Widget> getEmptyHouse(int floorAmount, double height) {
    double heightPercent = _floorHeight;

    double firstFloorStart = _bottomPadding + height * _groundHeight;
    List<Widget> house = [
      Positioned(
        bottom: _bottomPadding,
        child: SvgPicture.asset(
          "assets/memorygame/whichismyfloor/ground.svg",
          alignment: Alignment.bottomCenter,
          height: height * _groundHeight,
        ),
      ),
    ];
    for (int i = 0; i < floorAmount; i++) {
      house.add(
        Positioned(
            bottom: firstFloorStart,
            child: Container(
              child: DragTarget<OrderItem>(
                  builder:
                      (BuildContext context, List incoming, List rejected) {
                    return _score[_data[i]] == true
                        ? Container(
                            height: height * heightPercent,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    color: _windowColor,
                                    width: 200,
                                    height: height * (heightPercent - 0.01),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: height * heightPercent,
                                    child: Image.asset(_data[i].pic),
                                  ),
                                  SvgPicture.asset(
                                    "assets/memorygame/whichismyfloor/floor.svg",
                                    height: height * heightPercent,
                                  ),
                                ]),
                          )
                        : Container(
                            height: height * heightPercent,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    color: _windowColor,
                                    width: 200,
                                    height: height * (heightPercent - 0.01),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: height * heightPercent,
                                  ),
                                  SvgPicture.asset(
                                    "assets/memorygame/whichismyfloor/floor.svg",
                                    height: height * heightPercent,
                                  ),
                                ]),
                          );
                  },
                  onWillAccept: (data) => data.number == _data[i].number,
                  onAccept: (e) {
                    setState(() {
                      _score[e] = true;
                    });
                    if (_score.length == _data.length) {
                      RememberOrderState().nextRound();
                    }
                  }),
            )),
      );
      firstFloorStart += height * (_floorHeight - 0.01);
    }
    house.add(
      Positioned(
        bottom: firstFloorStart,
        child: SvgPicture.asset(
          "assets/memorygame/whichismyfloor/roof.svg",
          alignment: Alignment.bottomCenter,
          height: height * _roofHeight,
        ),
      ),
    );
    return house;
  }

  @override
  void initState() {
    _data = getData(_orderLength);
    _shuffledData = List<OrderItem>.from(_data);
    _shuffledData.shuffle();
    _isAction = false;
    _isHouseItemVisible = true;
    _optionOpacity = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _isAction
        ? Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: getEmptyHouse(_orderLength, size.height),
              ),
              Container(
                child: Positioned(
                  bottom: 20,
                  child: Wrap(
                    children: _shuffledData.map((item) {
                      return Draggable<OrderItem>(
                        data: item,
                        feedback: Container(
                          margin: EdgeInsets.all(5),
                          child: Container(child: Image.asset(item.pic)),
                          height: 80,
                        ),
                        child: (_score[item] == true)
                            ? Container(
                                margin: EdgeInsets.all(5),
                                width: 80,
                                height: 80,
                              )
                            : AnimatedOpacity(
                                duration: _isActionAnimationDuration,
                                opacity: _optionOpacity,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Image.asset(item.pic),
                                  height: 80,
                                ),
                              ),
                        childWhenDragging: Container(
                          margin: EdgeInsets.all(5),
                          height: 80,
                          width: 80,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          )
        : Stack(
            children: <Widget>[
              Stack(
                  alignment: Alignment.center,
                  children: getHouse(_orderLength, size.height)),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    bottom: 20,
                    child: GestureDetector(
                      child: AnimatedContainer(
                        duration: _isActionAnimationDuration,
                        height: _startButtonHeight,
                        width: 150,
                        child: Text('Go'),
                        color: Colors.lightBlueAccent,
                        alignment: Alignment.center,
                      ),
                      onTap: () {
                        startRound();
                      },
                    ),
                  )
                ],
              )
            ],
          );
  }
}
