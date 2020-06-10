import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/logic/extraitem/Figures.dart';

import 'ExtraItemGameRound.dart';

getShape(int index) {
  List shapes = [
    DrawCircle(),
    DrawSquare(),
    DrawTriangle(),
    DrawHexagon(),
  ];
  return shapes[index];
}

List<Color> colors = [
  Colors.purpleAccent,
  Colors.deepPurpleAccent,
  Colors.lightBlue,
  Colors.redAccent,
  Colors.green,
  Colors.amber
];

List<double> sizes = [70, 95, 115, 135];
List<double> localSizes = [80, 130];
List getDifferentFiguresByColor() {
  colors.shuffle();
//  shapes.shuffle();
  sizes.shuffle();
  List data = [
    getShape(Random().nextInt(4))
      ..color = colors[0]
      ..figureSize = sizes[0],
    getShape(Random().nextInt(4))
      ..color = colors[1]
      ..figureSize = sizes[1]
      ..setIsRight = true,
    getShape(Random().nextInt(4))
      ..color = colors[0]
      ..figureSize = sizes[2],
    getShape(Random().nextInt(4))
      ..color = colors[0]
      ..figureSize = sizes[3],
  ];
  data.shuffle();
  return data;
}

List getSameFiguresByColor() {
  colors.shuffle();
//  shapes.shuffle();
  sizes.shuffle();
  List data = [
    getShape(1)
      ..color = colors[0]
      ..figureSize = sizes[0],
    getShape(1)
      ..color = colors[1]
      ..figureSize = sizes[1]
      ..setIsRight = true,
    getShape(1)
      ..color = colors[0]
      ..figureSize = sizes[2],
    getShape(1)
      ..color = colors[0]
      ..figureSize = sizes[3],
  ];
  data.shuffle();
  return data;
}

List getSameFiguresBySize() {
  localSizes.shuffle();
  colors.shuffle();
  int shape = Random().nextInt(4);
  List data = [
    getShape(shape)
      ..color = colors[0]
      ..figureSize = localSizes[0]
      ..setIsRight = true,
    getShape(shape)
      ..color = colors[1]
      ..figureSize = localSizes[1],
    getShape(shape)
      ..color = colors[2]
      ..figureSize = localSizes[1],
    getShape(shape)
      ..color = colors[3]
      ..figureSize = localSizes[1],
  ];
  data.shuffle();
  return data;
}

List getDifferentFiguresBySize() {
  colors.shuffle();

  localSizes.shuffle();
  List data = [
    getShape(Random().nextInt(4))
      ..color = colors[0]
      ..figureSize = localSizes[0]
      ..setIsRight = true,
    getShape(Random().nextInt(4))
      ..color = colors[1]
      ..figureSize = localSizes[1],
    getShape(Random().nextInt(4))
      ..color = colors[2]
      ..figureSize = localSizes[1],
    getShape(Random().nextInt(4))
      ..color = colors[3]
      ..figureSize = localSizes[1],
  ];
  data.shuffle();
  return data;
}

List getDifferentFiguresByShape() {
  colors.shuffle();
  sizes.shuffle();
  int randomIndex = Random().nextInt(3);

  List data = [
    getShape(randomIndex)
      ..color = colors[0]
      ..figureSize = sizes[0]
      ..setIsRight = true,
    getShape(randomIndex + 1)
      ..color = colors[1]
      ..figureSize = sizes[1],
    getShape(randomIndex + 1)
      ..color = colors[2]
      ..figureSize = sizes[2],
    getShape(randomIndex + 1)
      ..color = colors[3]
      ..figureSize = sizes[3],
  ];
  data.shuffle();
  return data;
}

List getSameFiguresByShape() {
  colors.shuffle();
  sizes.shuffle();
//  shapes.shuffle();
  List data = [
    getShape(1)
      ..color = colors[0]
      ..figureSize = sizes[0]
      ..setIsRight = true,
    getShape(2)
      ..color = colors[0]
      ..figureSize = sizes[1],
    getShape(2)
      ..color = colors[0]
      ..figureSize = sizes[2],
    getShape(2)
      ..color = colors[0]
      ..figureSize = sizes[3],
  ];
  data.shuffle();
  return data;
}

List<List> itemGenerator = [
  getSameFiguresByColor(),
  getDifferentFiguresByColor(),
  getSameFiguresBySize(),
  getDifferentFiguresBySize(),
  getSameFiguresByShape(),
  getDifferentFiguresByShape(),
];

List <ExtraItemGameRound> extraItemRounds = [
  ExtraItemGameRound(),
  ExtraItemGameRound(),
  ExtraItemGameRound(),
  ExtraItemGameRound(),
  ExtraItemGameRound(),
  ExtraItemGameRound(),
];