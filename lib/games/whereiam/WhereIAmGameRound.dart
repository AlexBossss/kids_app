import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/whereiam/Data.dart';
import 'package:kidsapp/games/whereiam/WhereIAmGame.dart';

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

  GlobalKey<FlipCardState> searchItem = GlobalKey<FlipCardState>();

  startRound() {
    setState(() {
      _buttonHeight = 0;
      _animatedWidth = 100;
    });
    flipCards();
  }

  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Wrap(
            children: _data
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      if (e != _data[_random] && _isAction) {
                        _cardStateKeys[_data.indexOf(e)]
                            .currentState
                            .toggleCard();
                        Future.delayed(Duration(milliseconds: 900), () {
                          _cardStateKeys[_data.indexOf(e)]
                              .currentState
                              .toggleCard();
                        });
                      } else if (e == _data[_random] && _isAction) {
                        _cardStateKeys[_data.indexOf(e)]
                            .currentState
                            .toggleCard();
                        _isAction = false;
                        Future.delayed(Duration(milliseconds: 900), () {
                          searchItem.currentState.toggleCard();
                          WhereIAmGameState().nextRound();
                        });
                      }
                    },
                    child: Container(
                      height: 90,
                      child: FlipCard(
                        flipOnTouch: false,
                        key: _cardStateKeys[_data.indexOf(e)],
                        front: Image.asset(e),
                        back: Image.asset(missing),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          GestureDetector(
            onTap: () => startRound(),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              alignment: Alignment.center,
              height: _buttonHeight,
              width: 200,
              child: Text('Go'),
              color: Colors.green,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 800),
            width: _animatedWidth,
            child: FlipCard(
              key: searchItem,
              front: Image.asset(_data[_random]),
              back: Image.asset(correct),
              flipOnTouch: false,
            ),
          )
        ],
      ),
    );
  }
}
