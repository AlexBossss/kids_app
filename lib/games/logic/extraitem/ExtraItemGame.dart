import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsapp/games/logic/extraitem/ExtraItemGameRound.dart';
import 'package:kidsapp/games/logic/extraitem/lightbulbprogress/Garland.dart';
import 'package:kidsapp/games/logic/extraitem/lightbulbprogress/LightBulb.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BobData>(create: (context) => BobData()),
        ChangeNotifierProvider<GarlandData>(create: (context) => GarlandData()),
      ],
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
               width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,
                child: SvgPicture.asset('assets/extraitem/fridge_back.svg',fit: BoxFit.cover,),
              ),
              Positioned(
                top: 50,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.15,
                    height: MediaQuery.of(context).size.height / 1.9,
                    child: SvgPicture.asset('assets/extraitem/cloud.svg', fit: BoxFit.fill),
                  ),
                ),
              ),
              Container(
                child: Garland(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 6.5,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: roundGameModel,
                ),
              ),
              Positioned(
                bottom: -100,
                width: MediaQuery.of(context).size.width / 0.8,
                height: MediaQuery.of(context).size.height / 1.7,
                child: Bob(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
