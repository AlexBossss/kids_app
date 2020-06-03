import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data.dart';

class FindPairGame extends StatefulWidget {
  @override
  _FindPairState createState() => _FindPairState();
}

class _FindPairState extends State<FindPairGame> {
  List<PairCard> _data;
  List _flipState;
  List<bool> _isChoose;
  List<bool> _isDone;
  PairCard _previousCard;
  bool _isFinished;


  void _restart(){
    _isFinished = false;
    _isDone = getIsSelectList();
    _isChoose = getIsSelectList();
    _data = getData();
    _flipState = getCardKeys();
  }
  @override
  void initState() {
    _restart();
    super.initState();
  }

  void choose(int index) {
    setState(() {
      _isChoose[index] = true;
    });
  }

  void unChoose(int index) {
    setState(() {
      _isChoose[index] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isFinished ?Container(
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
    ): Scaffold(
      body: Container(
        width: 400,
        child: Center(
          child: Wrap(
            children: _data
                .map((e) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Stack(children: [
                        Container(
                          height: 80,
                          width: 80,
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          height: _isChoose[e.num] ? 80 : 70,
                          child: GestureDetector(
                            onTap: () => {
                              if (_previousCard == null && !_isDone[e.num])
                                {_previousCard = e, choose(e.num)}
                              else if (e.pic == _previousCard.pic &&
                                  e.num != _previousCard.num)
                                {
                                  print('done'),
                                  _isDone[e.num] = true,
                                  _isDone[_previousCard.num] = true,
                                  unChoose(_previousCard.num),
                                  _flipState[_previousCard.num]
                                      .currentState
                                      .toggleCard(),
                                  _flipState[e.num].currentState.toggleCard(),
                                  _previousCard = null,
                                  if (_isDone
                                      .every((element) => element == true))
                                    {_isFinished = true, print('finished')}
                                }
                              else if (e.pic != _previousCard.pic)
                                {
                                  unChoose(_previousCard.num),
                                  _previousCard = null,
                                  print('wrong'),
                                }
                              else
                                {_previousCard = null, unChoose(e.num)}
                            },
                            child: FlipCard(
                              key: _flipState[e.num],
                              flipOnTouch: false,
                              front: Image.asset(e.pic),
                              back: Image.asset(correct),
                            ),
                          ),
                        ),
                      ]),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
