import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

List<String> animals = [
  'assets/animalspics/fox.png',
  'assets/animalspics/hippo.png',
  'assets/animalspics/horse.png',
  'assets/animalspics/monkey.png',
  'assets/animalspics/panda.png',
  'assets/animalspics/parrot.png',
  'assets/animalspics/rabbit.png',
  'assets/animalspics/andrew.png',
  'assets/animalspics/zoo.png'
];

String missing = 'assets/animalspics/question.png';

int itemAmounts = 4;
List <String> getData(){
  animals.shuffle();
  return animals.sublist(0,itemAmounts);
}


List <GlobalKey<FlipCardState>>  getKeys(){
  List<GlobalKey<FlipCardState>> keys = [];
  for(int i = 0; i < itemAmounts; i ++){
    keys.add(GlobalKey<FlipCardState>());
  }
  return keys;
}