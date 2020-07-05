import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/extraitem/lightbulbprogress/LightBulb.dart';
import 'package:provider/provider.dart';

class Garland extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List roundSate = Provider.of<GarlandData>(context).getRoundState;

    double _width = MediaQuery.of(context).size.width;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: _width,
            height: 100,
          ),
          Container(
            width: _width,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/extraitem/ropeForLightBulb.png'),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left:(_width)/7-12,
            child: roundSate[0]? LightBulb('red') : Container(),
          ),
          Positioned(
            top: 20,
            left: ((_width)/7)*2-12,
            child: roundSate[1]? LightBulb('blue') : Container(),
          ),
          Positioned(
            top: 30,
            left: ((_width)/7)*3-12,
            child: roundSate[2]? LightBulb('blue') : Container(),
          ),
          Positioned(
            top: 30,
            left: ((_width)/7)*4-12,
            child: roundSate[3]? LightBulb('red') : Container(),
          ),
          Positioned(
            top: 20,
            left:((_width)/7)*5-12,
            child:roundSate[4]? LightBulb('blue') : Container(),
          ),
          Positioned(
            top: 10,
            left: ((_width)/7)*6-12,
            child: roundSate[5]? LightBulb('red') : Container(),
          ),

        ],
      ),
    );
  }
}


class GarlandData extends ChangeNotifier{

 int _currentRound = 0;
 List <bool> _rounds = [
   false,
   false,
   false,
   false,
   false,
   false,
 ];

 void finishRound(){
   _rounds[_currentRound] = true;
   notifyListeners();
   if(_currentRound < _rounds.length-1){
     _currentRound++;
   }else{
     restart();
   }
 }

 List get getRoundState => _rounds;

 void restart(){
   _currentRound = 0;
    _rounds = [
     false,
     false,
     false,
     false,
     false,
     false,
   ];
    notifyListeners();
 }
}