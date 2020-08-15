import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kidsapp/games/memory/rememberorder/RememberOrderRound.dart';
import 'package:kidsapp/models/Data/FlareData.dart';
import 'package:kidsapp/models/RoundGameModel.dart';

class RememberOrder extends StatefulWidget {
  @override
  RememberOrderState createState() => RememberOrderState();
}

class RememberOrderState extends State<RememberOrder> {
  bool _isStart;
  bool _isHouseVisible;
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
    _isHouseVisible = false;
    _isStart = false;
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Future.delayed(
        Duration(milliseconds: 1700),
        () => {
              setState(() => _isStart = true),
              Future.delayed(Duration(milliseconds: 10),
                  () => setState(() => _isHouseVisible = true))
            });
  }

  @override
  Widget build(BuildContext context) {
    return _isStart
        ? Scaffold(
            body: Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: FlareData().whichFlorDoILiveBackground),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _isHouseVisible ? 1.0 : 0.0,
                child: whatSuitsRounds,
              )
            ]),
          )
        : FlareData().whichFlorDoILiveBackgroundStart;
  }

  void nextRound() {
    whatSuitsRounds.nextRound();
  }
}
