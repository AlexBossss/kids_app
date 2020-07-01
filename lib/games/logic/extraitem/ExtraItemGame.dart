import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: roundGameModel,
              ),
              Container(
                height: 300,
                width: 300,
                child: Bob(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
