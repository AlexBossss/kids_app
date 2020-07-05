import 'Item.dart';

List<String> square = [
  'assets/extraitem/shapedpics/square/squareChocolate.svg',
  'assets/extraitem/shapedpics/square/squareJuice.svg',
  'assets/extraitem/shapedpics/square/squareMilk.svg',
  'assets/extraitem/shapedpics/square/squarePan.svg',
];

List<String> circle = [
  'assets/extraitem/shapedpics/circle/circleOrange.svg',
  'assets/extraitem/shapedpics/circle/circlePizza.svg',
  'assets/extraitem/shapedpics/circle/circleTomato.svg',
];

List<String> triangle = [
  'assets/extraitem/shapedpics/triangle/triangleCheese.svg',
  'assets/extraitem/shapedpics/triangle/triangleIcecream.svg',
  'assets/extraitem/shapedpics/triangle/triangleWatermelon.svg',
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
    Item(otherItemsList[0],isExtra: false,),
    Item(otherItemsList[1],isExtra: false,),
    Item(otherItemsList[2],isExtra: false,),
  ];
  data.shuffle();
  return data;
}
