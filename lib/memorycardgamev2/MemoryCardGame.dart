import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/memorycardgamev2/MemoryCardEnums.dart';

import 'Data.dart';

class MemoryGame extends StatefulWidget {
  final Level _level;
  final Kind _kind;

  MemoryGame(this._level, this._kind);

  @override
  _MemoryGameState createState() => _MemoryGameState(_level, _kind);
}

class _MemoryGameState extends State<MemoryGame> {
  _MemoryGameState(this._level, this._kind);

  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;
  Kind _kind;

  Level _level;

  bool _isFinished;
  List<String> _data;

  List<bool> _cardFlips;
  List<GlobalKey<FlipCardState>> _cardStateKeys;

  Widget getItem(Kind kind, int index) {
    switch (kind) {
      case Kind.Animals:
        {
          return Container(
            margin: EdgeInsets.all(4.0),
            color: Colors.white,
            child: Image.asset(_data[index]),
          );
        }
        break;
      case Kind.Numbers:
        {
          return Container(
            margin: EdgeInsets.all(4.0),
            color: Colors.lightBlueAccent,
            child: Center(
              child: Text(_data[index]),
            ),
          );
        }
        break;
    }
  }

  int getCrossAmount() {
    if (_level == Level.Hard || _level == Level.Medium) {
      return 4;
    } else
      return 3;
  }

  void restart() {
    _data = getSourceArray(_level, _kind);
    _cardFlips = getInitialItemState(_level);
    _cardStateKeys = getCardStateKeys(_level);

    _isFinished = false;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _start = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    restart();
  }

  @override
  Widget build(BuildContext context) {
    return _isFinished
        ? Scaffold(
            body: Container(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        restart();
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
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Count',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getCrossAmount(),
                        ),
                        itemBuilder: (context, index) => _start
                            ? FlipCard(
                                key: _cardStateKeys[index],
                                onFlip: () {
                                  if (!_flip) {
                                    _flip = true;
                                    _previousIndex = index;
                                  } else {
                                    _flip = false;
                                    if (_previousIndex != index) {
                                      if (_data[_previousIndex] !=
                                          _data[index]) {
                                        Future.delayed(
                                            const Duration(seconds: 1), () {
                                          _cardStateKeys[_previousIndex]
                                              .currentState
                                              .toggleCard();
                                          _cardStateKeys[index].currentState.toggleCard();
                                          _previousIndex = index;
                                        });
                                      } else {
                                        _cardFlips[_previousIndex] = false;
                                        _cardFlips[index] = false;
                                        print(_cardFlips);
                                        if (_cardFlips
                                            .every((t) => t == false)) {
                                          print("Won");
                                          Future.delayed(
                                              const Duration(seconds: 1), () {
                                            setState(() {
                                              _isFinished = true;
                                              _start = false;
                                            });
                                          });
                                        }
                                      }
                                    }
                                  }
                                  setState(() {});
                                },
                                flipOnTouch: _cardFlips[index],
                                direction: FlipDirection.HORIZONTAL,
                                front: Container(
                                  margin: EdgeInsets.all(4.0),
                                  color:
                                      Colors.lightBlueAccent.withOpacity(0.3),
                                ),
                                back: getItem(_kind, index))
                            : getItem(_kind, index),
                        itemCount: _data.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
