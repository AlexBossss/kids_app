import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidsapp/games/logic/completepicture/CompletePictureGameRound.dart';
import 'package:kidsapp/models/Data/FlareData.dart';
import 'package:kidsapp/models/RoundGameModel.dart';

class CompletePicture extends StatefulWidget {
  @override
  CompletePictureState createState() => CompletePictureState();
}

class CompletePictureState extends State<CompletePicture> {

  bool _isVisible;
  bool _isStart;

  static List<CompletePictureGameRound> _data = [
    CompletePictureGameRound(),
    CompletePictureGameRound(),
    CompletePictureGameRound(),
    CompletePictureGameRound(),
    CompletePictureGameRound(),
    CompletePictureGameRound(),
  ];

  RoundGameModel _completePicRounds = RoundGameModel(_data);

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
       child: FlareData().completePicStart,
      ),
      Positioned(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: _isVisible ? 1.0 : 0.0,
              child: _completePicRounds),
        ),
      ),
    ]));
  }

  void nextRound() {
   _completePicRounds.nextRound();
  }
}
