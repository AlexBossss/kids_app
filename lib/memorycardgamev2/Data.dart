import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

import 'MemoryCardEnums.dart';

List<String> fillSourceArray(Kind kind) {
  switch (kind) {
    case Kind.Animals:
      {
        return [
          'assets/memorygame/img/fox.png',
          'assets/memorygame/img/fox.png',
          'assets/memorygame/img/hippo.png',
          'assets/memorygame/img/hippo.png',
          'assets/memorygame/img/horse.png',
          'assets/memorygame/img/horse.png',
          'assets/memorygame/img/monkey.png',
          'assets/memorygame/img/monkey.png',
          'assets/memorygame/img/panda.png',
          'assets/memorygame/img/panda.png',
          'assets/memorygame/img/parrot.png',
          'assets/memorygame/img/parrot.png',
          'assets/memorygame/img/rabbit.png',
          'assets/memorygame/img/rabbit.png',
          'assets/memorygame/img/zoo.png',
          'assets/memorygame/img/zoo.png'
        ];
      }
      break;
    case Kind.Numbers:
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
        return fillSourceArray(Kind.Animals);
      }
  }
}

List getSourceArray(Level level, Kind kind) {
  List<String> levelAndKindList = new List<String>();
  List sourceArray = fillSourceArray(kind);
  if (level == Level.Hard) {
    sourceArray.forEach((element) {
      levelAndKindList.add(element);
    });
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = new List<bool>();
  if (level == Level.Hard) {
    for (int i = 0; i < 16; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys =
      new List<GlobalKey<FlipCardState>>();
  if (level == Level.Hard) {
    for (int i = 0; i < 16; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 6; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}
