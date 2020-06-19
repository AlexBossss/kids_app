import 'Item.dart';

List<String> square = [
  'assets/shapedpics/square/fridge.svg',
  'assets/shapedpics/square/letter.svg',
  'assets/shapedpics/square/note.svg',
  'assets/shapedpics/square/phone.svg',
  'assets/shapedpics/square/present.svg',
  'assets/shapedpics/square/tv.svg',
  'assets/shapedpics/square/washer.svg',
  'assets/shapedpics/square/window.svg',
];

List<String> circle = [
  'assets/shapedpics/circle/ballon.svg',
  'assets/shapedpics/circle/bowling.svg',
  'assets/shapedpics/circle/pig.svg',
  'assets/shapedpics/circle/newyear.svg',
];

List<String> triangle = [
  'assets/shapedpics/triangle/cheese.svg',
  'assets/shapedpics/triangle/house.svg',
  'assets/shapedpics/triangle/pizza.svg',
  'assets/shapedpics/triangle/shelter.svg',
  'assets/shapedpics/triangle/watermelon.svg',
];

List<List<String>> figures = [triangle, square, circle];

void shuffleData() {
  figures.shuffle();
  square.shuffle();
  circle.shuffle();
  triangle.shuffle();
}

List<Item> getShapeData() {
  shuffleData();
  List<String> extraItemList = figures[0];
  List<String> otherItemsList = figures[1];
  List<Item> data = [
    Item(
      extraItemList[0],
      isExtra: true,
    ),
    Item(otherItemsList[0]),
    Item(otherItemsList[1]),
    Item(otherItemsList[2]),
  ];
  data.shuffle();
  return data;
}
