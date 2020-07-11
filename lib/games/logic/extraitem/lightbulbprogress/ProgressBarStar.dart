import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/extraitem/lightbulbprogress/Star.dart';
import 'package:provider/provider.dart';

class ProgressBarStar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List roundSate = Provider.of<ProgressBarStarData>(context).getRoundState;

    double _width = MediaQuery.of(context).size.width;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: _width,
            height: 100,
          ),
          Positioned(
            top: 20,
            left:(_width)/7-25,
            child: roundSate[0]? Star() : Container(),
          ),
          Positioned(
            top: 30,
            left: ((_width)/7)*2-25,
            child: roundSate[1]? Star() : Container(),
          ),
          Positioned(
            top: 40,
            left: ((_width)/7)*3-25,
            child: roundSate[2]? Star() : Container(),
          ),
          Positioned(
            top: 40,
            left: ((_width)/7)*4-25,
            child: roundSate[3]? Star() : Container(),
          ),
          Positioned(
            top: 30,
            left:((_width)/7)*5-25,
            child:roundSate[4]? Star() : Container(),
          ),
          Positioned(
            top: 20,
            left: ((_width)/7)*6-25,
            child: roundSate[5]? Star() : Container(),
          ),

        ],
      ),
    );
  }
}

class ProgressBarStarData extends ChangeNotifier{

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

 bool isGameFinished(){
   if (_rounds.every((element) => element == true)){
     Future.delayed(Duration(milliseconds: 4000), () {
       restart();
     });
     return true;
   } else  {
     return false;
   }
 }
}