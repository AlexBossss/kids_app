import 'Item.dart';

List<String> square = [
  'assets/shapedpics/square/squareLetter.flr',
  'assets/shapedpics/square/squareNote.flr',
  'assets/shapedpics/square/squareTV.flr',
  'assets/shapedpics/square/squareWasher.flr',
  'assets/shapedpics/square/squareWindow.flr',
];

List<String> circle = [
  'assets/shapedpics/circle/circleBallon.flr',
  'assets/shapedpics/circle/circleBowling.flr',
  'assets/shapedpics/circle/circleNewYearBall.flr',
];

List<String> triangle = [
  'assets/shapedpics/triangle/triangleCheese.flr',
  'assets/shapedpics/triangle/triangleHause.flr',
  'assets/shapedpics/triangle/triangleWatermelon.flr',
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
