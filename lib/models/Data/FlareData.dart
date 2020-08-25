import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';

class FlareData{
  Widget whichFlorDoILiveBackground = FlareActor(
    'assets/memorygame/whichismyfloor/housebackground.flr',
    animation: 'Move',
    fit: BoxFit.cover,
  );

  Widget whichFlorDoILiveBackgroundStart  = FlareActor(
  'assets/memorygame/whichismyfloor/housebackground.flr',
  animation: 'Start',
  fit: BoxFit.cover,
  );

  Widget whereDoILiveStart  = FlareActor(
    'assets/memorygame/wheredoilive/whereDoILiveBackGround.flr',
    animation: 'Start',
    fit: BoxFit.cover,
  );

  Widget whereDoILive  = FlareActor(
    'assets/memorygame/wheredoilive/whereDoILiveBackGround.flr',
    animation: 'Move',
    fit: BoxFit.cover,
  );

  Widget paintPicStart  = FlareActor(
    'assets/logic/paintpicitems/paintPicBackground.flr',
    animation: 'Start',
    fit: BoxFit.cover,
  );

  Widget completePicStart  = FlareActor(
    'assets/logic/completepic/CompletePicBack.flr',
    animation: 'Start',
    fit: BoxFit.cover,
  );

  Widget findPairStart  = FlareActor(
    'assets/attentiongame/findpair/findPairBack.flr',
    animation: 'Start',
    fit: BoxFit.cover,
  );
}