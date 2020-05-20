import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/ItemGame.dart';
import 'package:kidsapp/src/theme/color/light_color.dart';

class MemoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: LightColor.homeBackgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child: Column(children: [
          GameItem(
              LightColor.itemGameBackground1,
              'Memory',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memoryGame.png',
              '/memoryCardGame'),
          GameItem(
              LightColor.itemGameBackground2,
              'Memory',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memoryGame.png',
              '/memoryCardGame'),
          GameItem(
              LightColor.itemGameBackground3,
              'Memory',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memoryGame.png',
              '/memoryCardGame'),
        ]),
      ),
    );
  }
}
