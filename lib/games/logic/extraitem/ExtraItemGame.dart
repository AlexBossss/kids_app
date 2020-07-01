import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsapp/games/logic/extraitem/ExtraItemGameRound.dart';
import 'package:kidsapp/models/Bob.dart';
import 'package:kidsapp/models/RoundGameModel.dart';
import 'package:provider/provider.dart';

class ExtraItemGame extends StatefulWidget {
  @override
  ExtraItemGameState createState() => ExtraItemGameState();
}

class ExtraItemGameState extends State<ExtraItemGame> {

  List<ExtraItemGameRound> _rounds;

  static RoundGameModel roundGameModel;

  @override
  void initState() {
    _rounds = [
      ExtraItemGameRound(),
      ExtraItemGameRound(),
      ExtraItemGameRound(),
      ExtraItemGameRound(),
      ExtraItemGameRound(),
      ExtraItemGameRound(),
    ];
    roundGameModel = RoundGameModel(_rounds);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BobData>(
        create: (context) => BobData(),
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  child: SvgPicture.asset(
                    'assets/extraitem/background.svg',
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.8,
                  top: 50,
                  child: SvgPicture.asset(
                    'assets/extraitem/bubble.svg',
                  ),
                ),
                Positioned(
                  top: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: roundGameModel,
                  ),
                ),
                Positioned(
                  bottom: -100,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.7,
                  child: Bob(),
                ),
              ],
            ),
          ),
        ));
  }
}
