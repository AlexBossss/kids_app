import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data.dart';
import 'RememberCardRound.dart';

class RememberCard extends StatefulWidget {
  @override
  RememberCardState createState() => RememberCardState();
}

class RememberCardState extends State<RememberCard> {
  static var _index;
  final List<Color> colors = [Color(0xFFF3D1FF), Color(0xFF93EBFF)];
  double _step = 1/rounds.length;
  static var _progress;

  void nextRound() {
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (_index.value < rounds.length - 1) {
        _index.value++;
        _progress.value = _step + _progress.value;
        print(_step);
      } else if (_index.value == rounds.length - 1) {
        print('finish');
      } else {
        _index.value = 0;
      }
    });
  }

  @override
  void initState() {
    _progress = new ValueNotifier(0.0);
    _index = new ValueNotifier(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ValueListenableBuilder<double>(
              valueListenable: _progress,
              builder: (context, value, child) => LinearProgressIndicator(
                value: _progress.value,
              ),
            ),
            Container(
              child: ValueListenableBuilder<int>(
                valueListenable: _index,
                builder: (context, value, child) {
                  return IndexedStack(
                    index: _index.value,
                    children: rounds,
                  );
                },
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print(_index.value);
                nextRound();
              },
              child: Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  "print",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
