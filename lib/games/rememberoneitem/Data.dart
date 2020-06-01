import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:kidsapp/games/rememberoneitem/RememberOneItemRound.dart';

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
List <String> getData(int part){

  if(part == 1){
    animals.shuffle();
  return animals.sublist(0,itemAmounts);
  } else {
    return animals.sublist(itemAmounts,8);
  }
}


List <GlobalKey<FlipCardState>>  getKeys(){
  List<GlobalKey<FlipCardState>> keys = [];
  for(int i = 0; i < itemAmounts; i ++){
    keys.add(GlobalKey<FlipCardState>());
  }
  return keys;
}

List<RememberOneItemRound> oneItemRounds = [
  RememberOneItemRound(),
  RememberOneItemRound(),
  RememberOneItemRound(),
  RememberOneItemRound(),
  RememberOneItemRound(),
];