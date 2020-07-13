import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/Data/AudioData.dart';
import 'package:kidsapp/models/ItemGame.dart';
import 'package:kidsapp/src/theme/color/light_color.dart';
import 'package:provider/provider.dart';

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
              'Remember Card',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memorygame/memoryGame.png',
              '/rememberCard'),
          GameItem(
              LightColor.itemGameBackground3,
              'Remember Order',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memorygame/memoryGame.png',
              '/rememberOrder'),
          GameItem(
              LightColor.itemGameBackground4,
              'Remember one item',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memorygame/memoryGame.png',
              '/rememberOneItem'),
          GameItem(
              LightColor.itemGameBackground5,
              'Where am I',
              'Super game for clever guy and girls from 3 to 5 years',
              'assets/memorygame/memoryGame.png',
              '/whereIAmGame'),
          GestureDetector(
            onTap: () => {
              if(Provider.of<AudioData>(context, listen: false).mainThemePlayer == null)
                 { Provider.of<AudioData>(context, listen: false).startMainPlayer(),
                  print('Music on')} else{
                Provider.of<AudioData>(context, listen: false).switchPlayerOff(),
                print('music off')
              }
            },
            child: Container(
              width: 100,
              height: 20,
              child: Text(Provider.of<AudioData>(context).status),
              color: Colors.blue,
            ),
          )
        ]),
      ),
    );
  }
}
