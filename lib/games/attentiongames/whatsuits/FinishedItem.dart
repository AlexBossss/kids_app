import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class FinishedItem extends StatefulWidget {
  final String pic;
  final Color color;

  FinishedItem(this.pic, this.color);

  @override
  _FinishedItemState createState() => _FinishedItemState(pic, color);
}

class _FinishedItemState extends State<FinishedItem>
    with TickerProviderStateMixin {
  _FinishedItemState(this._pic, this._color);

  AnimationController animationController;
  Animation<double> angleAnimation;
  String _pic;
  double _itemSize = 100;
  Color _color;

  void initState() {
    _itemSize = 100;
    animationController = AnimationController(
        duration: Duration(milliseconds: 1100), vsync: this);



    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController.view,
      builder: (context, child){
        return Transform.rotate(
            angle: animationController.value * 2 * pi,
            child:Container(
                width: _itemSize,
                height: _itemSize,
                child: SvgPicture.asset(
                  _pic,
                  color: _color,
                )));
      },
    );
  }
}
