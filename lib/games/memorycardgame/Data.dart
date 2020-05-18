import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

import 'MemoryCardEnums.dart';

List<String> fillSourceArray(Kind kind) {
  switch (kind) {
    case Kind.Animals:
      {
        return [
          'assets/animalspics/fox.png',
          'assets/animalspics/fox.png',
          'assets/animalspics/hippo.png',
          'assets/animalspics/hippo.png',
          'assets/animalspics/horse.png',
          'assets/animalspics/horse.png',
          'assets/animalspics/monkey.png',
          'assets/animalspics/monkey.png',
          'assets/animalspics/panda.png',
          'assets/animalspics/panda.png',
          'assets/animalspics/parrot.png',
          'assets/animalspics/parrot.png',
          'assets/animalspics/rabbit.png',
          'assets/animalspics/rabbit.png',
          'assets/animalspics/zoo.png',
          'assets/animalspics/zoo.png'
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
