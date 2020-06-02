

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

import 'WhereIAmGameRound.dart';

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
String correct = 'assets/animalspics/correct.png';



int amount = 4;

List <GlobalKey<FlipCardState>>  getKeys(){
  List<GlobalKey<FlipCardState>> keys = [];
  for(int i = 0; i < amount; i ++){
    keys.add(GlobalKey<FlipCardState>());
  }
  return keys;
}
List getData() {
  animals.shuffle();
  return animals.sublist(0,amount);
}

List <WhereIAmGameRound> whereIAmRounds = [
  WhereIAmGameRound(),
  WhereIAmGameRound(),
  WhereIAmGameRound(),
  WhereIAmGameRound(),
  WhereIAmGameRound(),
];
