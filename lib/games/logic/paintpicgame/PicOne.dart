import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PicOne extends StatefulWidget {
  @override
  _PicOneState createState() => _PicOneState();
}

class _PicOneState extends State<PicOne> {
  bool _isGreenSet;
  bool _isBlueSet;
  bool _isYellowSet;
  bool _isGraySet;
  Color green = Colors.lightGreenAccent;
  Color blue = Colors.lightBlueAccent;
  Color yellow = Colors.amber;
  Color gray = Colors.white70;

  List<Color> _colors;

  @override
  void initState() {
    _colors = [green, blue, yellow, gray];
    _isGreenSet = false;
    _isBlueSet = false;
    _isYellowSet = false;
    _isGraySet = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    DragTarget<Color>(
                      onWillAccept: (data) => data == blue,
                      onAccept: (e) {
                        setState(() {
                          _isBlueSet = true;
                        });
                      },
                      builder: ((BuildContext context, List incoming,
                          List rejected) {
                        return _isBlueSet
                            ? Container(
                          width: 300,
                          height: 300,
                          color: Colors.lightBlueAccent,
                        )
                            : Container(
                          width: 300,
                          height: 300,
                          color: Colors.white,
                        );
                      }),
                    ),
                    Positioned(
                      child: DragTarget<Color>(
                          onAccept: (e) {
                            setState(() {
                              _isYellowSet = true;
                            });
                          },
                          onWillAccept: (data) => data == yellow,
                          builder: (BuildContext context, List incoming,
                              List rejected) {
                            return _isYellowSet
                                ? Container(
                              child: SvgPicture.asset(
                                'assets/logic/paintpicitems/Sun.svg',
                                width: 100,
                                height: 100,
                                color: yellow,
                              ),
                            )
                                : Container(
                              child: SvgPicture.asset(
                                'assets/logic/paintpicitems/Sun.svg',
                                width: 100,
                                height: 100,
                              ),
                            );
                          }),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: DragTarget<Color>(
                        onWillAccept: (data) => data == green,
                        onAccept: (e) {
                          setState(() {
                            _isGreenSet = true;
                          });
                        },
                        builder: (BuildContext context, List incoming,
                            List rejected) {
                          return _isGreenSet
                              ? Container(
                            child: SvgPicture.asset(
                              'assets/logic/paintpicitems/Grass.svg',
                              width: 300,
                              color: green,
                            ),
                          )
                              : Container(
                              child: SvgPicture.asset(
                                'assets/logic/paintpicitems/Grass.svg',
                                width: 300,
                              ));
                        },
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 10,
                      child: DragTarget<Color>(
                        onWillAccept: (data) => data == gray,
                        onAccept: (e) {
                          setState(() {
                            _isGraySet = true;
                          });
                        },
                        builder: (BuildContext context, List incoming,
                            List rejected) {
                          return _isGraySet
                              ? Container(
                            child: SvgPicture.asset(
                              'assets/logic/paintpicitems/Cloud.svg',
                              width: 120,
                              color: gray,
                            ),
                          )
                              : Container(
                              child: SvgPicture.asset(
                                'assets/logic/paintpicitems/Cloud.svg',
                                width: 120,
                              ));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _colors
                    .map((e) => Container(
                  child: Draggable(
                    data: e,
                    feedback: Container(width: 50, height: 50,color:e),
                    child: Container(width: 50, height: 50,color:e),
                    childWhenDragging: Container(width: 50, height: 50,color:e),
                  ),
                ))
                    .toList()
            ),
          ],
        ),
      ),
    );
  }
}
