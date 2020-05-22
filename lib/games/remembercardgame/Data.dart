import 'RememberCardRound.dart';

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
String correct = 'assets/animalspics/correct.png';

List<String> getData(){
  List<String> _data =animals;
  _data.shuffle();
  return _data;
}

List <RememberCardRound> rounds = [
  RememberCardRound(amountOfSearchItems: 1),
  RememberCardRound(amountOfSearchItems: 2),
  RememberCardRound(amountOfSearchItems: 3),
  RememberCardRound(amountOfSearchItems: 4),
  RememberCardRound(amountOfSearchItems: 5),
];