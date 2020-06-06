import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> animals = [
  'assets/animalspics/fox.png',
  'assets/animalspics/hippo.png',
  'assets/animalspics/horse.png',
  'assets/animalspics/monkey.png',
  'assets/animalspics/panda.png',
  'assets/animalspics/parrot.png',
  'assets/animalspics/rabbit.png',
  'assets/animalspics/andrew.png',
  'assets/animalspics/zoo.png'
];

double _picSize = 200;


List <CardForPic> getData(int random) {
  String pic = animals[random];
  List <CardForPic> data = [];
  data.add(CardForPic(0, Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.lightBlueAccent,
            width: _picSize / 2,
            height: _picSize / 2,
          ),
          Positioned(
            child: Image.asset(pic),
            top: 0,
            left: 0,
            width: _picSize,
            height: _picSize,
          )
        ],
      ),
    ),
  ),);

  data.add(CardForPic(1, Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.lightBlueAccent,
            width: _picSize / 2,
            height: _picSize / 2,
          ),
          Positioned(
            child: Image.asset(pic),
            top: 0,
            right: 0,
            width: _picSize,
            height: _picSize,
          )
        ],
      ),
    ),
  ),);
  data.add(CardForPic(2, Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.lightBlueAccent,
            width: _picSize / 2,
            height: _picSize / 2,
          ),
          Positioned(
            child: Image.asset(pic),
            bottom: 0,
            left: 0,
            width: _picSize,
            height: _picSize,
          )
        ],
      ),
    ),
  ),);
  data.add(CardForPic(3, Container(

      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.lightBlueAccent,
            width: _picSize / 2,
            height: _picSize / 2,
          ),
          Positioned(
            child: Image.asset(pic),
            bottom: 0,
            right: 0,
            width: _picSize,
            height: _picSize,
          )
        ],
      ),
    ),
  ),);
  return data;
}

class CardForPic {
  int position;
  Container element;

  CardForPic(this.position, this.element);
}