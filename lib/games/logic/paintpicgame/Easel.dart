import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsapp/models/RoundGameModel.dart';

class Easel extends StatelessWidget {

 final RoundGameModel paintPicGame;

  const Easel(this.paintPicGame);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[

         Container(
            width: 350,
            height: 550,
            child: SvgPicture.asset('assets/logic/paintpicitems/easel.svg'),
          ),

        Positioned(
          left: (MediaQuery.of(context).size.width -350)/2,
          top: 60,
          child: paintPicGame,
        )
      ],
    );
  }
}
