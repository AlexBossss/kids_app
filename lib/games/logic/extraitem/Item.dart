import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsapp/games/logic/extraitem/ExtraItemGame.dart';
import 'package:kidsapp/games/logic/extraitem/lightbulbprogress/ProgressBarStar.dart';
import 'package:kidsapp/models/Bob.dart';
import 'package:provider/provider.dart';

class Item extends StatefulWidget {
  Item(this.pic, {this.isExtra});

  final String pic;
  final bool isExtra;

  @override
  _ItemState createState() => _ItemState(pic, isExtra: isExtra);
}

class _ItemState extends State<Item> with TickerProviderStateMixin {
  _ItemState(
    this.pic, {
    this.isExtra,
  });

  AnimationController animationController;
  Animation<double> angleAnimation;

  AnimationController wrongAnswerAnimationController;
  Animation<double> wrongAnswerAngleAnimation;

  int _wrongAnimationTime = 1000;

  String pic;
  double _itemSize;
  bool isExtra;
  bool isDone = false;

  removeItem() {

      isDone = true;
    Provider.of<BobData>(context, listen: false).changeAnimation('Dance');
    Provider.of<ProgressBarStarData>(context, listen: false).finishRound();
    if (isExtra == true) {
      setState(() {
        _itemSize = 110;
        Future.delayed(const Duration(milliseconds: 550), () {
          _itemSize = 0;
        });
      });
      Future.delayed(const Duration(milliseconds: 1250), () {
        ExtraItemGameState.roundGameModel.nextRound();
      });
    }

  }

  wrongAnswerAnimationStart() {
    Provider.of<BobData>(context, listen: false).changeAnimation('Wave');
    wrongAnswerAnimationController.forward();
    if (wrongAnswerAngleAnimation.status == AnimationStatus.completed) {
      wrongAnswerAnimationController.reverse();
    }
  }

  @override
  void initState() {
    _itemSize = 100;
    animationController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);

    wrongAnswerAnimationController = AnimationController(
        duration: Duration(milliseconds: _wrongAnimationTime), vsync: this);

    final CurvedAnimation curve = CurvedAnimation(
        parent: wrongAnswerAnimationController,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic);

    wrongAnswerAngleAnimation = Tween<double>(begin: 0, end: 2).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    angleAnimation =
        Tween<double>(begin: -0.03, end: 0.03).animate(animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animationController.forward();
              setState(() {});
            }
          });

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    wrongAnswerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _itemSize,
      width: _itemSize,
      child: GestureDetector(
        onTap: () =>
            (isExtra) ? !isDone?removeItem(): null : wrongAnswerAnimationStart(),
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(pi * wrongAnswerAngleAnimation.value),
          origin: Offset(_itemSize / 2, 0),
          child: Container(
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: angleAnimation.value,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 1200),
                  width: _itemSize,
                  height: _itemSize,
                  child: SvgPicture.asset(pic)),
            ),
          ),
        ),
      ),
    );
  }
}
