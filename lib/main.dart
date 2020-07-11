import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/completepicture/CompletePictureGame.dart';
import 'package:kidsapp/games/logic/extraitem/ExtraItemGame.dart';
import 'package:kidsapp/games/logic/paintpicgame/PaintPicGame.dart';
import 'package:kidsapp/games/logic/rightway/PlaceRightObjectGame.dart';
import 'package:kidsapp/games/remembercardgame/RememberCard.dart';
import 'package:kidsapp/games/rememberorder/RememberOrder.dart';
import 'package:kidsapp/games/rememberoneitem/RememberOneItem.dart';
import 'package:kidsapp/games/whereiam/WhereIAmGame.dart';

import 'package:kidsapp/home/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'games/attentiongames/findpair/FindPairGame.dart';
import 'games/attentiongames/whatsuits/WhatSuitsGame.dart';
import 'games/logic/extraitem/lightbulbprogress/ProgressBarStar.dart';
import 'games/memorycardgame/MemoryCardGameMenu.dart';
import 'package:kidsapp/src/theme/theme.dart';

import 'models/Bob.dart';

//super app next 1
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the of your application.
  // This widget is the of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider<BobData>(create: (context) => BobData()),
    ChangeNotifierProvider<ProgressBarStarData>(create: (context) => ProgressBarStarData()),
    ],
     child: MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => HomeScreen(),
          '/memoryCardGame': (BuildContext context) => MemoryCardGameMenu(),
          '/rememberCard': (BuildContext context) => RememberCard(),
          '/rememberOrder': (BuildContext context) => RememberOrder(),
          '/rememberOneItem': (BuildContext context) => RememberOneItem(),
          '/whereIAmGame': (BuildContext context) => WhereIAmGame(),
          '/findPairGame': (BuildContext context) => FindPairGame(),
          '/completePictureGame': (BuildContext context) => CompletePictureGame(),
          '/extraItemGame': (BuildContext context) => ExtraItemGame(),
          '/whatSuits' : (BuildContext context) => WhatSuitsGame(),
          '/paintPicGame' : (BuildContext context) => PaintPicGame(),
          '/rightWayGame' : (BuildContext context) => PlaceRightObjectGame(),
        },
      )
    );
  }
}
