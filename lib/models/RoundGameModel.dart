import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundGameModel extends StatefulWidget {
  final  List <Widget> rounds;

  RoundGameModel(this.rounds);

  @override
  RoundGameModelState createState() =>  RoundGameModelState(rounds: rounds);
  void nextRound(){
    RoundGameModelState(rounds: rounds).nextRound();
  }
}

class RoundGameModelState extends State<RoundGameModel> {

  final List <Widget> rounds;

  RoundGameModelState({this.rounds});

  static var _index;
  static var _progress;
  double _step;



  void nextRound() {
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (_index.value < rounds.length) {
        _step =1 / rounds.length;
        _index.value++;
        _progress.value = _step + _progress.value;
        print(_index.value);
      }
    });
  }

  void _restart() {
    _progress =  ValueNotifier(0.0);
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
//            ValueListenableBuilder<double>(
//              valueListenable:_progress,
//              builder: (context, value, child) => LinearProgressIndicator(
//                value: _progress.value,
//              ),
//            ),
            ValueListenableBuilder(
                valueListenable: _index,
                builder: (context, value, child) {
                  return (_index.value == rounds.length)
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
                      :IndexedStack(
                    index: _index.value,
                    children: rounds,
                  );
                }),
          ],
        ),
      );
  }
}
