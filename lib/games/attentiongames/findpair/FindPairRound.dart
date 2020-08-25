import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Data.dart';
import 'FindPairGame.dart';

class FindPairRound extends StatefulWidget {
  @override
  _FindPairState createState() => _FindPairState();
}

class _FindPairState extends State<FindPairRound> {
  List<PairCard> _data;
  List _flipState;
  List<bool> _isChoose;
  List<bool> _isDone;
  PairCard _previousCard;

  void _restart() {
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
    return Stack(children: [
      Positioned(
        bottom: (MediaQuery.of(context).size.height - 330) / 2,
        left: (MediaQuery.of(context).size.width - 350) / 2,
        child: Container(
          width: 360,
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
                                    {FindPairGameState().nextRound()}
                                }
                              else if (e.pic != _previousCard.pic)
                                {
                                  unChoose(_previousCard.num),
                                  _previousCard = null,
                                }
                              else
                                {_previousCard = null, unChoose(e.num)}
                            },
                            child: FlipCard(
                              key: _flipState[e.num],
                              flipOnTouch: false,
                              front: Image.asset(e.pic),
                              back: SvgPicture.asset(
                                'assets/attentiongame/findpair/findPairWindow.svg',
                                width: 80,
                                height: 80,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ))
                .toList(),
          ),
        ),
      ),
    ]);
  }
}
