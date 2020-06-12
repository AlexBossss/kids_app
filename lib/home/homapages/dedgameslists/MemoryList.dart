import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/ItemGame.dart';
import 'package:kidsapp/src/theme/color/light_color.dart';

class MemoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Center(
        child: ListView(children: [
          GameItem(
              LightColor.itemGameBackground1,
              'Memory',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memorygame/memoryGame.png',
              '/memoryCardGame'),
          GameItem(
              LightColor.itemGameBackground2,
              'Memory',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memorygame/memoryGame.png',
              '/rememberCard'),
          GameItem(
              LightColor.itemGameBackground3,
              'Memory',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memorygame/memoryGame.png',
              '/rememberOrder'),
          GameItem(
              LightColor.itemGameBackground4,
              'Memory',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memorygame/memoryGame.png',
              '/rememberOneItem'),
          GameItem(
              LightColor.itemGameBackground5,
              'Memory',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memorygame/memoryGame.png',
              '/whereIAmGame'),
        ]),
      ),
    );
  }
}
