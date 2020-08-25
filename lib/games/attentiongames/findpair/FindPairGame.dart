import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidsapp/models/Data/FlareData.dart';
import 'package:kidsapp/models/RoundGameModel.dart';

import 'FindPairRound.dart';

class FindPairGame extends StatefulWidget {
  @override
  FindPairGameState createState() => FindPairGameState();
}

class FindPairGameState extends State<FindPairGame> {

  bool _isStart;
  bool _isVisible;
  static List<FindPairRound> _data = [FindPairRound()];

  RoundGameModel _findPairRounds = RoundGameModel(
    _data,
  );

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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: FlareData().findPairStart,
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _isVisible ? 1.0 : 0.0,
            child: _findPairRounds,
          )
        ],
      ),
    );
  }

  void nextRound() {
    _findPairRounds.nextRound();
  }
}
