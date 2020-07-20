import 'RememberOrderRound.dart';

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

List getData(int amount) {
  animals.shuffle();
  List<OrderItem> data = [];
  for (int i = 0; i < amount; i++) {
    data.add(OrderItem(number: i, pic: animals[i]));
  }
  return data;
}

class OrderItem {
  int number;
  String pic;

  OrderItem({this.number, this.pic});
}

var rounds = [
  RememberOrderRound(
    orderLength: 2,
  ),
  RememberOrderRound(
    orderLength: 2,
  ),
  RememberOrderRound(
    orderLength: 3,
  ),
  RememberOrderRound(
    orderLength: 3,
  ),
  RememberOrderRound(
    orderLength: 4,
  ),
  RememberOrderRound(
    orderLength: 4,
  ),
];
