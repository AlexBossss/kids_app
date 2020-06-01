import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data.dart';

class RememberOrder extends StatefulWidget {
  @override
  RememberOrderState createState() => RememberOrderState();
}

class RememberOrderState extends State<RememberOrder> {
  static var _index;
  static var _progress;
  double _step = 1 / rounds.length;

  void nextRound() {
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (_index.value < rounds.length) {
        _index.value++;
        _progress.value = _step + _progress.value;
        print(_index.value);
      }
    });
  }

  void _restart() {
    _progress =  ValueNotifier(0.0);
    _index = ValueNotifier(0);
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
              valueListenable:_progress,
              builder: (context, value, child) => LinearProgressIndicator(
                value: _progress.value,
              ),
            ),
            ValueListenableBuilder(
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
                      :IndexedStack(
                    index: _index.value,
                    children: rounds,
                  );
                }),
          ],
        ),
      ),
    );
  }
}