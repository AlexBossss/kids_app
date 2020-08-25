import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/paintpicgame/Easel.dart';
import 'package:kidsapp/models/RoundGameModel.dart';
import 'package:kidsapp/models/Data/FlareData.dart';

import 'PicOne.dart';

class PaintPicGame extends StatefulWidget {
  @override
  _PaintPicGameState createState() => _PaintPicGameState();
}

class _PaintPicGameState extends State<PaintPicGame> {
  bool _isVisible;
  static List<Widget> _data = [
    PicOne(),
  ];

  RoundGameModel _paintPicGame = RoundGameModel(_data);

  @override
  void initState() {
    _isVisible = false;
    super.initState();
    Future.delayed(
        Duration(milliseconds: 2000),
        () => {
              setState(() => _isVisible = true),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FlareData().paintPicStart),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: MediaQuery.of(context).size.height * 0.18,
            child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _isVisible ? 1.0 : 0.0,
                child: Easel(_paintPicGame)),
          )
        ],
      ),
    );
  }

  void nextRound() {
    _paintPicGame.nextRound();
  }
}
