import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

import 'MemoryCardEnums.dart';

List<String> fillSourceArray(Kind kind) {
  switch (kind) {
    case Kind.ANIMALS:
      {
        return [
          'assets/fox.png',
          'assets/fox.png',
          'assets/hippo.png',
          'assets/hippo.png',
          'assets/horse.png',
          'assets/horse.png',
          'assets/monkey.png',
          'assets/monkey.png',
          'assets/panda.png',
          'assets/panda.png',
          'assets/parrot.png',
          'assets/parrot.png',
          'assets/rabbit.png',
          'assets/rabbit.png',
          'assets/zoo.png',
          'assets/zoo.png'
        ];
      }
      break;
    case Kind.NUMBERS:
      {
        return [
          '1',
          '1',
          '2',
          '2',
          '3',
          '3',
          '4',
          '4',
          '5',
          '5',
          '6',
          '6',
          '7',
          '7',
          '8',
          '8'
        ];
      }
      break;
    default:
      {
        return fillSourceArray(Kind.ANIMALS);
      }
  }
}

List getSourceArray(Level level, Kind kind) {
  List<String> levelAndKindList = new List<String>();
  List sourceArray = fillSourceArray(kind);
  if (level == Level.HARD) {
    sourceArray.forEach((element) {
      levelAndKindList.add(element);
    });
  } else if (level == Level.MID) {
    for (int i = 0; i < 12; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  } else if (level == Level.EASY) {
    for (int i = 0; i < 6; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = new List<bool>();
  if (level == Level.HARD) {
    for (int i = 0; i < 16; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.MID) {
    for (int i = 0; i < 12; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.EASY) {
    for (int i = 0; i < 6; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys =
      new List<GlobalKey<FlipCardState>>();
  if (level == Level.HARD) {
    for (int i = 0; i < 16; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.MID) {
    for (int i = 0; i < 12; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.EASY) {
    for (int i = 0; i < 6; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}
