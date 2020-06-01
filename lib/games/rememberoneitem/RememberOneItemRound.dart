import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/rememberoneitem/Data.dart';

class RememberOneItemRound extends StatefulWidget {
  @override
  _RememberOneItemRoundState createState() => _RememberOneItemRoundState();
}

class _RememberOneItemRoundState extends State<RememberOneItemRound> {
  List<String> _data;
  List<GlobalKey<FlipCardState>> _cardStateKeys;
  List<String> _answers;
  double _buttonHeight = 50;
  double _topPaddingToAnimation = 400;
  double _heightAnswers = 0;
  bool _isDone;
  double _answersWidth = 360;

  @override
  void initState() {
    _isDone = false;
    _cardStateKeys = getKeys();
    _data = getData();
    _random = Random().nextInt(4);
    _answers = getAnswers();
    super.initState();
  }

  List getAnswers() {
    List answers = getData();
    answers.forEach((element) {
      while (element == _data[_random]) {
        answers = getData();
      }
    });
    answers[_random] = _data[_random];
    answers.shuffle();
    return answers;
  }

  void removeButton() {
    setState(() {
      _buttonHeight = 0;
      _topPaddingToAnimation = 50;
      _heightAnswers = 90;
    });
  }

  void removeAnswers() {
    Future.delayed(Duration(milliseconds: 900), () {
      setState(() {
        _answersWidth = 0;
      });
    });
  }

  int _random;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Wrap(
            children: _data
                .map((e) => Container(
                    height: 90,
                    child: FlipCard(
                        flipOnTouch: false,
                        key: _cardStateKeys[_data.indexOf(e)],
                        front: Image.asset(e),
                        back: Image.asset(missing))))
                .toList(),
          ),
          GestureDetector(
            onTap: () => {
              _cardStateKeys[_random].currentState.toggleCard(),
              print(_random),
              removeButton()
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              alignment: Alignment.center,
              height: _buttonHeight,
              width: 200,
              child: Text('Go'),
              color: Colors.green,
            ),
          ),
          AnimatedPadding(
            padding: EdgeInsets.only(
              top: _topPaddingToAnimation,
            ),
            duration: Duration(milliseconds: 800),
            child: AnimatedContainer(
              height: _heightAnswers,
              curve: Curves.bounceOut,
              duration: Duration(milliseconds: 200),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                width: _answersWidth,
                child: Wrap(
                  children: _answers
                      .map((e) => GestureDetector(
                            onTap: () {
                              if (e == _data[_random] && !_isDone) {
                                _cardStateKeys[_random]
                                    .currentState
                                    .toggleCard();
                                _isDone = true;
                                removeAnswers();
                              }
                            },
                            child: Container(
                              child: Image.asset(e),
                              height: 90,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
