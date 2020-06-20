import 'package:flutter/cupertino.dart';
import 'package:kidsapp/games/logic/extraitem/ExtraItemGameRound.dart';
import 'package:kidsapp/models/RoundGameModel.dart';

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
    return Container(
      child: roundGameModel,
    );
  }
}
