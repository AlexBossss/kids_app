import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/lightbulbprogress/ProgressBarStar.dart';
import 'package:provider/provider.dart';

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
    Provider.of<ProgressBarStarData>(context, listen: false).start();
    _index = ValueNotifier(0);
  }

  @override
  void initState() {
    _restart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isGameFished =
    Provider.of<ProgressBarStarData>(context).isGameFinished();
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          ValueListenableBuilder(
              valueListenable: _index,
              builder: (context, value, child) {
                return (_index.value == rounds.length)
                    ? Container(
                  height: MediaQuery.of(context).size.height,
                          alignment: Alignment.center,
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
                                  border: Border.all(width: 3),
                                  color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.circular(24)),
                              child: Text(
                                "Replay",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                      )
                    : IndexedStack(
                        index: _index.value,
                        children: rounds,
                      );
              }),
          ProgressBarStar(),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: isGameFished
                  ? FlareActor(
                'assets/BalloonsAnimation.flr',
                animation: 'goUP',
              )
                  : Container()),
        ],
      ),
    );
  }
}
