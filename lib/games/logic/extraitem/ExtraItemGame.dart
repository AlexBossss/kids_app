import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsapp/games/logic/extraitem/ExtraItemGameRound.dart';
import 'package:kidsapp/games/logic/extraitem/lightbulbprogress/ProgressBarStar.dart';
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

  bool isGameStart = false;

  void startGame() {
    Future.delayed(
        Duration(milliseconds: 2000),
        () => {
              setState(() {
                isGameStart = true;
              })
            });
  }

  @override
  void initState() {
    Provider.of<ProgressBarStarData>(context, listen: false).restart();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _rounds = [
      ExtraItemGameRound(),
      ExtraItemGameRound(),
      ExtraItemGameRound(),
      ExtraItemGameRound(),
      ExtraItemGameRound(),
      ExtraItemGameRound(),
    ];
    roundGameModel = RoundGameModel(_rounds);
    startGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

   bool isGameFished = Provider.of<ProgressBarStarData>(context).isGameFinished();

    return
      Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SvgPicture.asset(
                  'assets/extraitem/fridge_back.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 50,
                child: isGameStart? Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.15,
                    height: MediaQuery.of(context).size.height / 1.9,
                    child: SvgPicture.asset('assets/extraitem/cloud.svg',
                        fit: BoxFit.fill),
                  ),
                ) : Container(),
              ),
              Container(
                child: ProgressBarStar(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 6.5,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: isGameStart? roundGameModel : Container(),
                ),
              ),
              Positioned(
                bottom: -100,
                width: MediaQuery.of(context).size.width / 0.8,
                height: MediaQuery.of(context).size.height / 1.7,
                child: Bob(),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child:  isGameFished ? FlareActor('assets/extraitem/BalloonsAnimation.flr',animation: 'goUP',): Container()
              ),
            ],
          ),
        ),
    );
  }
}
