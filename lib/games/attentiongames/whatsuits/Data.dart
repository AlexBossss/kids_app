import 'dart:ui';

import 'package:flutter/material.dart';

List<String> whatSuitsCurvedFigures = [
  'assets/whatsuitsicons/CurvedFigure1.svg',
  'assets/whatsuitsicons/CurvedFigure2.svg',
  'assets/whatsuitsicons/CurvedFigure3.svg',
  'assets/whatsuitsicons/CurvedFigure4.svg',
  'assets/whatsuitsicons/CurvedFigure5.svg',
  'assets/whatsuitsicons/CurvedFigure6.svg',
];
List<String> whatSuitsStars = [
  'assets/whatsuitsicons/Star1.svg',
  'assets/whatsuitsicons/Star2.svg',
  'assets/whatsuitsicons/Star3.svg',
  'assets/whatsuitsicons/Star4.svg',
  'assets/whatsuitsicons/Star5.svg',
  'assets/whatsuitsicons/Star6.svg',
];

List<String> whatSuitsKeys = [
  'assets/whatsuitsicons/Key1.svg',
  'assets/whatsuitsicons/Key2.svg',
  'assets/whatsuitsicons/Key3.svg',
  'assets/whatsuitsicons/Key4.svg',
  'assets/whatsuitsicons/Key5.svg',
  'assets/whatsuitsicons/Key6.svg',
];

List<String> whatSuitsCurvedStars = [
  'assets/whatsuitsicons/CurvedStar1.svg',
  'assets/whatsuitsicons/CurvedStar2.svg',
  'assets/whatsuitsicons/CurvedStar3.svg',
  'assets/whatsuitsicons/CurvedStar4.svg',
  'assets/whatsuitsicons/CurvedStar5.svg',
  'assets/whatsuitsicons/CurvedStar6.svg',
];

List<String> whatSuitsPuzzles = [
  'assets/whatsuitsicons/Puzzle1.svg',
  'assets/whatsuitsicons/Puzzle2.svg',
  'assets/whatsuitsicons/Puzzle3.svg',
  'assets/whatsuitsicons/Puzzle4.svg',
  'assets/whatsuitsicons/Puzzle5.svg',
  'assets/whatsuitsicons/Puzzle6.svg',
];

List<String> getCurvedData() {
  whatSuitsCurvedFigures.shuffle();
  return whatSuitsCurvedFigures.sublist(0, 3);
}

List<String> getStarsData() {
  whatSuitsStars.shuffle();
  return whatSuitsStars.sublist(0, 3);
}

List<String> getCurvedStarsData() {
  whatSuitsCurvedStars.shuffle();
  return whatSuitsCurvedStars.sublist(0, 3);
}

List<String> getPuzzlesData() {
  whatSuitsPuzzles.shuffle();
  return whatSuitsPuzzles.sublist(0, 3);
}

List<String> getKeysData() {
  whatSuitsKeys.shuffle();
  return whatSuitsKeys.sublist(0, 3);
}

List<bool> elementState = [
  false,
  false,
  false,
];

List<Color> colors = [
  Colors.amberAccent,
  Colors.lightGreen,
  Colors.deepPurpleAccent,
];
