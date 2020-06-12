import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/RoundGameModel.dart';

import 'WhatSuitsGameRound.dart';

class WhatSuitsGame extends StatefulWidget {
  @override
  WhatSuitsGameState createState() => WhatSuitsGameState();
}

class WhatSuitsGameState extends State<WhatSuitsGame> {
   static List<Widget> _data = [
    WhatSuitsRound(),
    WhatSuitsRound(),
    WhatSuitsRound(),
    WhatSuitsRound(),
    WhatSuitsRound(),
    WhatSuitsRound(),
  ];

  RoundGameModel whatSuitsRounds  = RoundGameModel(_data);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: whatSuitsRounds),
    );
  }
  void nextRound() {
      whatSuitsRounds.nextRound();
  }
}
