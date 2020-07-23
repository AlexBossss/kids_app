import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsapp/models/RoundGameModel.dart';

import 'WhereIAmGameRound.dart';


class WhereIAmGame extends StatefulWidget {
  @override
  WhereIAmGameState createState() => WhereIAmGameState();
}

class WhereIAmGameState extends State<WhereIAmGame> {
 static List <WhereIAmGameRound> _data = [
    WhereIAmGameRound(),
    WhereIAmGameRound(),
    WhereIAmGameRound(),
    WhereIAmGameRound(),
    WhereIAmGameRound(),
    WhereIAmGameRound(),
  ];
  RoundGameModel _whereDoILiveRounds = RoundGameModel(_data,);

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SvgPicture.asset(
              'assets/memorygame/wheredoilive/background-wheredoilive.svg',
              fit: BoxFit.cover,
            )),
        _whereDoILiveRounds,
      ]),
    );
  }

 void nextRound() {
   _whereDoILiveRounds.nextRound();
  }
}
