import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data.dart';

class RememberCard extends StatefulWidget {
  @override
  RememberCardState createState() => RememberCardState();
}

class RememberCardState extends State<RememberCard> {
  static var _index;
  final List<Color> colors = [Color(0xFFF3D1FF), Color(0xFF93EBFF)];
  double _step = 1 / rounds.length;
  static var _progress;

  void _restart() {
    _progress = new ValueNotifier(0.0);
    _index = new ValueNotifier(0);
  }

  void nextRound() {
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (_index.value < rounds.length) {
        _index.value++;
        _progress.value = _step + _progress.value;
        print(_index.value);
      }
    });
  }

  @override
  void initState() {
    _restart();
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
                  return (_index.value == rounds.length)
                      ? Container(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _restart();
                                    });
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
                                      "Replay",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        )
                      : IndexedStack(
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
                  "skip",
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
