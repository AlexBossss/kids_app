import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

List<PairCard> animals = [
  PairCard(0, 'assets/animalspics/fox.png'),
  PairCard(1, 'assets/animalspics/hippo.png'),
  PairCard(2, 'assets/animalspics/horse.png'),
  PairCard(3, 'assets/animalspics/monkey.png'),
  PairCard(4, 'assets/animalspics/panda.png'),
  PairCard(5, 'assets/animalspics/parrot.png'),
  PairCard(6, 'assets/animalspics/rabbit.png'),
  PairCard(7, 'assets/animalspics/zoo.png'),
  PairCard(8, 'assets/animalspics/fox.png'),
  PairCard(9, 'assets/animalspics/hippo.png'),
  PairCard(10, 'assets/animalspics/horse.png'),
  PairCard(11, 'assets/animalspics/monkey.png'),
  PairCard(12, 'assets/animalspics/panda.png'),
  PairCard(13, 'assets/animalspics/parrot.png'),
  PairCard(14, 'assets/animalspics/rabbit.png'),
  PairCard(15, 'assets/animalspics/zoo.png'),
];

String correct = 'assets/animalspics/correct.png';

List<PairCard> getData() {
  animals.shuffle();
  return animals;
}

List<GlobalKey<FlipCardState>> getCardKeys() {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  for (int i = 0; i < 16; i++) {
    cardStateKeys.add(GlobalKey<FlipCardState>());
  }

  return cardStateKeys;
}

List<bool> getIsSelectList() {
  List<bool> isChose = [];
  for (int i = 0; i < 16; i++) {
    isChose.add(false);
  }
  return isChose;
}

class PairCard {
  int num;
  String pic;

  PairCard(this.num, this.pic);
}
