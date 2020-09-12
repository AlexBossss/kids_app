import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class WhatSuitsItem extends StatefulWidget {
  final String pic;
  final Color color;

  WhatSuitsItem(this.pic, this.color);

  @override
  _WhatSuitsItemState createState() => _WhatSuitsItemState(pic, color);
}

class _WhatSuitsItemState extends State<WhatSuitsItem>
    with TickerProviderStateMixin {
  _WhatSuitsItemState(this._pic, this._color);

  AnimationController animationController;
  Animation<double> angleAnimation;
  String _pic;
  double _itemSize = 100;
  Color _color;

  void initState() {
    _itemSize = 100;
    animationController = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: angleAnimation.value,
        child: Container(
            width: _itemSize,
            height: _itemSize,
            child: SvgPicture.asset(
              _pic,
              color: _color,
            )));
  }
}
