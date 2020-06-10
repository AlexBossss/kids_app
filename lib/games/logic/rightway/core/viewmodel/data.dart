import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:kidsapp/games/logic/rightway/core/model/cardItem.dart';
import 'package:kidsapp/games/logic/rightway/ui/resources/constants.dart';

class Data with ChangeNotifier {
  bool successDrop;
  bool successDropTwo;
  List<CardItem> items;
  CardItem acceptedData;
  CardItem acceptedDataTwo;
  Color acceptedColor;
  Color acceptedColorTwo;
  Data() {
    successDrop = false;
    successDropTwo = false;
    acceptedColor = Colors.red;
    acceptedColorTwo = Colors.black12;

    items = Constants.initializeList(items);
  }

  bool get isSuccessDrop => successDrop;
  bool get isSuccessDropTwo => successDropTwo;

  List<CardItem> get itemsList => items;
  CardItem get getAcceptedData => acceptedData;
  Color get getAcceptedColor => acceptedColor;

  CardItem get getAcceptedDataTwo => acceptedDataTwo;
  Color get getAcceptedColorTwo => acceptedColorTwo;

  set setSuccessDrop(bool status) {
    successDrop = status;
    notifyListeners();
  }

  set setSuccessDropTwo(bool status) {
    successDropTwo = status;
    notifyListeners();
  }

  changeAcceptedData(CardItem data) {
    acceptedData = data;
    notifyListeners();
  }

  changeAcceptedDataTwo(CardItem data) {
    acceptedDataTwo = data;
    notifyListeners();
  }

  changeAcceptedColor(Color color) {
    acceptedColor = color;
    notifyListeners();
  }

  changeAcceptedColorTwo(Color color) {
    acceptedColorTwo = color;
    notifyListeners();
  }

  changeSuccessDrop(bool status) {
    setSuccessDrop = status;
  }

  changeSuccessDropTwo(bool status) {
    setSuccessDropTwo = status;
  }

  removeLastItem() {
    items.removeLast();
    notifyListeners();
  }

  addItemToList(CardItem item) {
    items.add(item);
    notifyListeners();
  }

  initializeDraggableList() {
    items = Constants.initializeList(items);
    notifyListeners();
  }
}
