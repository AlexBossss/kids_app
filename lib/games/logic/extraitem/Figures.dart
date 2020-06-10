import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawCircle extends CustomPainter {
  Color _color;
  Paint _paint;
  double _figureSize;
  bool _isRight;
  bool get getIsRight => _isRight;

  set setIsRight(bool value) {
    _isRight = value;
  }

  set color(Color value) {
    _color = value;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _paint = Paint()
      ..color = _color
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(_figureSize, _figureSize), _figureSize, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  set figureSize(double value) {
    _figureSize = value*0.5;
  }
}

class DrawSquare extends CustomPainter {
  double _squareSize;
  Color _color;
  bool _isRight;


  bool get getIsRight => _isRight;

  set setIsRight(bool value) {
    _isRight = value;
  }

  set figureSize(double value) {
    _squareSize = value;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 10
      ..color = _color;
    canvas.drawRect(Rect.fromLTWH(0, 0, _squareSize, _squareSize), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  set color(Color value) {
    _color = value;
  }
}

class DrawTriangle extends CustomPainter {
  Paint _paint;
  Color _color;
  double _triangleSize;
  bool _isRight;

  bool get getIsRight => _isRight;

  set setIsRight(bool value) {
    _isRight = value;
  }

  set color(Color value) {
    _color = value;
  }

  set figureSize(double value) {
    _triangleSize = value;
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    _paint = Paint()
      ..color = _color
      ..style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(_triangleSize / 2, 0);
    path.lineTo(0, _triangleSize);
    path.lineTo(_triangleSize, _triangleSize);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DrawHexagon extends CustomPainter {
  Paint _paint;
  Color _color;
  double _hexagonSize;
  bool _isRight;
  bool get getIsRight => _isRight;

  set setIsRight(bool value) {
    _isRight = value;
  }
  set color(Color value) {
    _color = value;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _paint = Paint()
      ..color = _color
      ..style = PaintingStyle.fill;
    var path = Path();
    path.lineTo(_hexagonSize * 0.3, 0);
    path.lineTo(_hexagonSize * 0.7, 0);
    path.lineTo(_hexagonSize, _hexagonSize * 0.3);
    path.lineTo(_hexagonSize, _hexagonSize * 0.7);
    path.lineTo(_hexagonSize * 0.7, _hexagonSize);
    path.lineTo(_hexagonSize * 0.3, _hexagonSize);
    path.lineTo(0, _hexagonSize * 0.7);
    path.lineTo(0, _hexagonSize * 0.3);
    path.lineTo(_hexagonSize * 0.3, 0);

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  set figureSize(double value) {
    _hexagonSize = value;
  }
}


