import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/ItemGame.dart';
import 'package:kidsapp/src/theme/color/light_color.dart';

class AttentionList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Center(
        child: ListView(children: [
          GameItem(
              LightColor.itemGameBackground1,
              'Find pair',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memorygame/memoryGame.png',
              '/findPairGame'),
          GameItem(
              LightColor.itemGameBackground2,
              'What suits',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memorygame/memoryGame.png',
              '/whatSuits'),
        ]),
      ),
    );
  }
}
