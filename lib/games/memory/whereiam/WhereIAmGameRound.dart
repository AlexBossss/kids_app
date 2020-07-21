import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsapp/games/memory/whereiam/Data.dart';
import 'package:kidsapp/games/memory/whereiam/WhereIAmGame.dart';

class WhereIAmGameRound extends StatefulWidget {
  @override
  _WhereIAmGameRoundState createState() => _WhereIAmGameRoundState();
}

class _WhereIAmGameRoundState extends State<WhereIAmGameRound> {
  List<String> _data;
  int _random;
  double _buttonHeight = 50;
  List<GlobalKey<FlipCardState>> _cardStateKeys;
  bool _isAction;
  double _animatedWidth;
  double _doorHeight;

  double _elementOneTopPadding;
  double _elementTwoTopPadding;
  double _elementThreeTopPadding;
  double _elementFourTopPadding;
  double _searchItemHeight;

  GlobalKey<FlipCardState> searchItem = GlobalKey<FlipCardState>();

  void checkAnswer(int index) {
    print(_data[index]);
    print(_data[_random]);
    print(_cardStateKeys);
    if (_data[index] != _data[_random] && _isAction) {
      _cardStateKeys[index].currentState.toggleCard();
      Future.delayed(Duration(milliseconds: 900), () {
        _cardStateKeys[index].currentState.toggleCard();
      });
    } else if (_data[index] == _data[_random] && _isAction) {
      _cardStateKeys[_data.indexOf(_data[index])].currentState.toggleCard();
      _isAction = false;
      Future.delayed(Duration(milliseconds: 900), () {
        searchItem.currentState.toggleCard();
        WhereIAmGameState().nextRound();
      });
    }
  }

  startRound() {
    setState(() {
      _buttonHeight = 0;
      _animatedWidth = MediaQuery.of(context).size.height * _searchItemHeight;
    });
    flipCards();
  }

  @override
  void initState() {
    _elementOneTopPadding = 0.24;
    _elementTwoTopPadding = 0.28;
    _elementThreeTopPadding = 0.45;
    _elementFourTopPadding = 0.46;
    _searchItemHeight = 0.17;
    _doorHeight = 100;
    _animatedWidth = 0;
    _isAction = false;
    _data = getData();
    _random = Random().nextInt(_data.length);
    _cardStateKeys = getKeys();
    print(_random);
    super.initState();
  }

  void flipCards() {
    _data.forEach((element) {
      _cardStateKeys[_data.indexOf(element)].currentState.toggleCard();
    });
    _isAction = true;
  }

  Widget getHillHouse(int index) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: 200,
        height: 120,
        child: SvgPicture.asset('assets/memorygame/wheredoilive/hill.svg'),
      ),
      GestureDetector(
        onTap: () => checkAnswer(index),
        child: Container(
          height: _doorHeight,
          child: FlipCard(
            flipOnTouch: false,
            key: _cardStateKeys[_data.indexOf(_data[index])],
            front: Image.asset(_data[index]),
            back: SvgPicture.asset(
              missing,
              height: _doorHeight,
            ),
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[

          Positioned(
              top: _height * _elementOneTopPadding,
              right: 0,
              child: getHillHouse(0)),
          Positioned(
              top: _height * _elementTwoTopPadding,
              left: 0,
              child: getHillHouse(1)),
          Positioned(
            top: _height * _elementOneTopPadding + 95,
            left: 100,
            width: 110,
            child: SvgPicture.asset('assets/memorygame/wheredoilive/fence.svg'),
          ),
          Positioned(
              top: _height * _elementThreeTopPadding,
              right: -20,
              child: getHillHouse(2)),
          Positioned(
              top: _height * _elementFourTopPadding,
              left: -20,
              child: getHillHouse(3)),
          Positioned(
            top: _height * _elementFourTopPadding + 70,
            left: 140,
            width: 150,
            child: SvgPicture.asset('assets/memorygame/wheredoilive/fence.svg'),
          ),
          Positioned(
            bottom: 20,
            child: GestureDetector(
              onTap: () => startRound(),
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    border: Border.all(width: 3),
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(24)
                ),
                duration: Duration(milliseconds: 200),
                alignment: Alignment.center,
                height: _buttonHeight,
                width: 150,
                child: Text('Go', style:  TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w500),),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 800),
              width: _animatedWidth,
              height: _animatedWidth,
              child: FlipCard(
                key: searchItem,
                front: Image.asset(_data[_random]),
                back: Image.asset(correct),
                flipOnTouch: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
