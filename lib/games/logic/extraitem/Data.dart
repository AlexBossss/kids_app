import 'Item.dart';

List<String> square = [
  'assets/logic/extraitem/shapedpics/square/squareChocolate.svg',
  'assets/logic/extraitem/shapedpics/square/squareJuice.svg',
  'assets/logic/extraitem/shapedpics/square/squareMilk.svg',
  'assets/logic/extraitem/shapedpics/square/squarePan.svg',
];

List<String> circle = [
  'assets/logic/extraitem/shapedpics/circle/circleOrange.svg',
  'assets/logic/extraitem/shapedpics/circle/circlePizza.svg',
  'assets/logic/extraitem/shapedpics/circle/circleTomato.svg',
];

List<String> triangle = [
  'assets/logic/extraitem/shapedpics/triangle/triangleCheese.svg',
  'assets/logic/extraitem/shapedpics/triangle/triangleIcecream.svg',
  'assets/logic/extraitem/shapedpics/triangle/triangleWatermelon.svg',
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
