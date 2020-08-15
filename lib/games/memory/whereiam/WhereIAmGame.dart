import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidsapp/models/Data/FlareData.dart';
import 'package:kidsapp/models/RoundGameModel.dart';

import 'WhereIAmGameRound.dart';

class WhereIAmGame extends StatefulWidget {
  @override
  WhereIAmGameState createState() => WhereIAmGameState();
}

class WhereIAmGameState extends State<WhereIAmGame> {
  bool _isStart;
  bool _isVisible;
  static List<WhereIAmGameRound> _data = [
    WhereIAmGameRound(),
    WhereIAmGameRound(),
    WhereIAmGameRound(),
    WhereIAmGameRound(),
    WhereIAmGameRound(),
    WhereIAmGameRound(),
  ];
  RoundGameModel _whereDoILiveRounds = RoundGameModel(
    _data,
  );

  @override
  void initState() {
    _isVisible = false;
    _isStart = false;
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Future.delayed(
        Duration(milliseconds: 2500),
        () => {
              setState(() => _isStart = true),
              Future.delayed(Duration(milliseconds: 10),
                  () => setState(() => _isVisible = true))
            });
  }

  @override
  Widget build(BuildContext context) {
    return _isStart
        ? Scaffold(
            body: Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: FlareData().whereDoILive),
              AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: _isVisible ? 1.0 : 0.0,
                  child: _whereDoILiveRounds),
            ]),
          )
        : FlareData().whereDoILiveStart;
  }

  void nextRound() {
    _whereDoILiveRounds.nextRound();
  }
}
