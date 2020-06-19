import 'package:flutter/cupertino.dart';

class RoundData extends ChangeNotifier {


  int index = 0;

  void moveRound() {
      index++;
      notifyListeners();
  }


  int get getIndex => index;

  void restart(){
    index = 0;
  }
}
