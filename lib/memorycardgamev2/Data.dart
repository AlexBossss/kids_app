import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

List<String> imagesPath = [
  'assets/fox.png',
  'assets/hippo.png',
  'assets/horse.png',
  'assets/monkey.png',
  'assets/panda.png',
  'assets/parrot.png',
  'assets/rabbit.png',
  'assets/zoo.png'
];

List getImagesPath(String level) {
  List<String> levelList = new List<String>();
  if (level == 'HARD') {
    imagesPath.forEach((element) {
      levelList.add(element);
      levelList.add(element);
    });
  }

  levelList.shuffle();
  return levelList;
}

List<bool> getInitialItemState(String level) {
  List<bool> initialItemState = new List<bool>();
  if (level == 'HARD') {
    for (int i = 0; i < 16; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(String level) {
  List<GlobalKey<FlipCardState>> cardStateKeys = new List<GlobalKey<FlipCardState>>();
  if (level == 'HARD') {
    for (int i = 0; i < 16; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}
