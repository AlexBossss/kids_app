
import 'package:flutter/material.dart';

import 'Data.dart';

class ExtraItemGame extends StatefulWidget {
  @override
  ExtraItemGameState createState() => ExtraItemGameState();
}

class ExtraItemGameState extends State<ExtraItemGame> {
  static var _index;
  double _step = 1 / extraItemRounds.length;
  static var _progress;

  void _restart() {
    _progress = new ValueNotifier(0.0);
    _index = new ValueNotifier(0);
  }

  void nextRound() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (_index.value < extraItemRounds.length) {
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
          ValueListenableBuilder<int>(
            valueListenable: _index,
            builder: (context, value, child) => (_index.value == extraItemRounds.length)
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
                :IndexedStack(
              index: _index.value,
              children: extraItemRounds,
            ),
          )
        ],
      ),
    ));
  }
}
