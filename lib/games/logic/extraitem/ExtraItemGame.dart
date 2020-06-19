import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/extraitem/RoundData.dart';
import 'package:provider/provider.dart';

import 'ExtraItemGameRound.dart';

class ExtraItemGame extends StatelessWidget {
  final List<ExtraItemGameRound> rounds = [
    ExtraItemGameRound(),
    ExtraItemGameRound(),
    ExtraItemGameRound(),
    ExtraItemGameRound(),
    ExtraItemGameRound(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[

          Consumer<RoundData>(
            builder: (context, container, child) {
              return Column(
                children: <Widget>[
                  Text('${container.getIndex}'),
                  IndexedStack(
                    index: container.getIndex,
                    children: rounds,
                  )
                ],
              );
            },
          ),
        ],
      )),
    );
  }
}
