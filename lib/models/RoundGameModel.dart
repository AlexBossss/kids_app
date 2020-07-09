import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundGameModel extends StatefulWidget {
  final List<Widget> rounds;

  RoundGameModel(this.rounds);

  @override
  RoundGameModelState createState() => RoundGameModelState(rounds: rounds);

  void nextRound() {
    RoundGameModelState(rounds: rounds).nextRound();
  }
}

class RoundGameModelState extends State<RoundGameModel> {
  final List<Widget> rounds;

  RoundGameModelState({this.rounds});

  static var _index;

  void nextRound() {
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (_index.value < rounds.length) {
        _index.value++;
      }
    });
  }

  void _restart() {
    _index = ValueNotifier(0);
  }

  @override
  void initState() {
    _restart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ValueListenableBuilder(
              valueListenable: _index,
              builder: (context, value, child) {
                return (_index.value == rounds.length)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Container(
                          child: GestureDetector(
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
                        ),
                      )
                    : IndexedStack(
                        index: _index.value,
                        children: rounds,
                      );
              }),
        ],
      ),
    );
  }
}

