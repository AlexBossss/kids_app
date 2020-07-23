import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidsapp/games/memory/rememberorder/RememberOrderRound.dart';
import 'package:kidsapp/models/RoundGameModel.dart';

class RememberOrder extends StatefulWidget {
  @override
  RememberOrderState createState() => RememberOrderState();
}

class RememberOrderState extends State<RememberOrder> {
  static List<Widget> _data = [
    RememberOrderRound(
      orderLength: 2,
    ),
    RememberOrderRound(
      orderLength: 2,
    ),
    RememberOrderRound(
      orderLength: 3,
    ),
    RememberOrderRound(
      orderLength: 3,
    ),
    RememberOrderRound(
      orderLength: 4,
    ),
    RememberOrderRound(
      orderLength: 4,
    ),
  ];

  RoundGameModel whatSuitsRounds = RoundGameModel(_data);

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FlareActor(
              'assets/memorygame/whichismyfloor/housebackground.flr',
              animation: 'moveClouds',
              fit: BoxFit.cover,
            )),
        whatSuitsRounds,
      ]),
    );
  }

  void nextRound() {
    whatSuitsRounds.nextRound();
  }
}
