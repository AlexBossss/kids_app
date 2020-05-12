import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/memorycardgamev2/MemoryCardEnums.dart';

import 'Data.dart';

class MemoryGame extends StatefulWidget {
  Level level;

  MemoryGame(this.level);

  @override
  _MemoryGameState createState() => _MemoryGameState(level);
}

class _MemoryGameState extends State<MemoryGame> {
  _MemoryGameState(this.level);

  int previousIndex = -1;
  bool flip = false;
  bool start = false;
  Kind kind = Kind.ANIMALS;
  Level level;

  List<String> data;

  List<bool> cardFlips;
  List<GlobalKey<FlipCardState>> cardStateKeys;

  Widget getItem(Kind kind, int index) {
    switch (kind) {
      case Kind.ANIMALS:
        {
          return Container(
            margin: EdgeInsets.all(4.0),
            color: Colors.white,
            child: Image.asset(data[index]),
          );
        }
        break;
      case Kind.NUMBERS:
        {
          return Container(
            margin: EdgeInsets.all(4.0),
            color: Colors.lightBlueAccent,
            child: Center(
              child: Text(data[index]),
            ),
          );
        }
        break;
    }
  }

  int getCrossAmount() {
    if (level == Level.HARD || level == Level.MID) {
      return 4;
    } else
      return 3;
  }

  @override
  void initState() {
    data = getSourceArray(level, kind);
    cardFlips = getInitialItemState(level);
    cardStateKeys = getCardStateKeys(level);
    print(level);
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        start = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Count',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAmount(),
                  ),
                  itemBuilder: (context, index) => start
                      ? FlipCard(
                          key: cardStateKeys[index],
                          onFlip: () {
                            if (!flip) {
                              flip = true;
                              previousIndex = index;
                            } else {
                              flip = false;
                              if (previousIndex != index) {
                                if (data[previousIndex] != data[index]) {
                                  cardStateKeys[previousIndex]
                                      .currentState
                                      .toggleCard();
                                  previousIndex = index;
                                } else {
                                  cardFlips[previousIndex] = false;
                                  cardFlips[index] = false;
                                  print(cardFlips);
                                  if (cardFlips.every((t) => t == false)) {
                                    print("Won");
                                  }
                                }
                              }
                            }
                            setState(() {});
                          },
                          flipOnTouch: cardFlips[index],
                          direction: FlipDirection.HORIZONTAL,
                          front: Container(
                            margin: EdgeInsets.all(4.0),
                            color: Colors.lightBlueAccent.withOpacity(0.3),
                          ),
                          back: getItem(kind, index))
                      : getItem(kind, index),
                  itemCount: data.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
