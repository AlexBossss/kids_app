import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data.dart';

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  int itemAmount = 12;
  int crossItemCount = 4;
  int previousIndex = -1;
  bool flip = false;
  bool start = false;

  Timer timer;
  List<String> dataImages = getImagesPath('HARD');
  List<bool> cardFlips = getInitialItemState("HARD");
  List<GlobalKey<FlipCardState>> cardStateKeys = getCardStateKeys("HARD");


  startGame() {}

  @override
  void initState() {
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
                    crossAxisCount: crossItemCount,
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
                                if (dataImages[previousIndex] !=
                                    dataImages[index]) {
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
                          },
                          flipOnTouch: cardFlips[index],
                          direction: FlipDirection.HORIZONTAL,
                          front: Container(
                            margin: EdgeInsets.all(4.0),
                            color: Colors.lightBlueAccent.withOpacity(0.3),
                          ),
                          back: Container(
                            margin: EdgeInsets.all(4.0),
                            color: Colors.white,
                            child: Image.asset(dataImages[index]),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.all(4.0),
                          color: Colors.white,
                          child: Image.asset(dataImages[index]),
                        ),
                  itemCount: dataImages.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
