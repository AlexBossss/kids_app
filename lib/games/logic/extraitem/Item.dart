import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsapp/games/logic/extraitem/ExtraItemGame.dart';



class Item extends StatefulWidget {
  Item(this.pic, {this.isExtra});

  final String pic;

  final bool isExtra;

  @override
  _ItemState createState() => _ItemState(pic, isExtra: isExtra);
}

class _ItemState extends State<Item> with SingleTickerProviderStateMixin {
  _ItemState(
    this.pic, {
    this.isExtra,
  });

  AnimationController animationController;
  Animation<double> angleAnimation;

  String pic;
  double _itemSize;
  bool isExtra;


  removeItem() {
    if (isExtra == true) {
      setState(() {
        _itemSize = 0;
      });
      Future.delayed(const Duration(milliseconds: 1250), (){
        ExtraItemGameState.roundGameModel.nextRound();
      });
    }
  }

  @override
  void initState() {
    _itemSize = 100;
    animationController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    super.initState();

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
            }
          });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => removeItem(),
      child: Container(
        alignment: Alignment.center,
        child: Transform.rotate(
          angle: angleAnimation.value,
          child: AnimatedContainer(
              duration: Duration(milliseconds: 1200),
              width: _itemSize,
              height: _itemSize,
              child: SvgPicture.asset(
                pic,
              )),
        ),
      ),
    );
  }
}
