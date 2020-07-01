import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kidsapp/games/logic/paintpicgame/PencilPicture.dart';

class PaintPicGame extends StatefulWidget {
  @override
  _PaintPicGameState createState() => _PaintPicGameState();
}

class _PaintPicGameState extends State<PaintPicGame> {
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
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                  borderRadius: BorderRadius.circular(12),
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
                                      'assets/paintpicitems/Sun.svg',
                                      width: 100,
                                      height: 100,
                                      color: yellow,
                                    ),
                                  )
                                : Container(
                                    child: SvgPicture.asset(
                                      'assets/paintpicitems/Sun.svg',
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
                                    'assets/paintpicitems/Grass.svg',
                                    width: 300,
                                    color: green,
                                  ),
                                )
                              : Container(
                                  child: SvgPicture.asset(
                                  'assets/paintpicitems/Grass.svg',
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
                                    'assets/paintpicitems/Cloud.svg',
                                    width: 120,
                                    color: gray,
                                  ),
                                )
                              : Container(
                                  child: SvgPicture.asset(
                                  'assets/paintpicitems/Cloud.svg',
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
                children: _colors
                    .map((e) => Container(
                          child: Draggable(
                            data: e,
                            feedback: PencilPicture(e),
                            child:PencilPicture(e),
                            childWhenDragging: PencilPicture(e),
                          ),
                        ))
                    .toList()
//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Container(
//                    child: Draggable<Color>(
//                      data: green,
//                      child: Container(
//                        height: 50,
//                        width: 50,
//                        color: green,
//                      ),
//                      childWhenDragging: Container(),
//                      feedback: Container(
//                        height: 50,
//                        width: 50,
//                        color: green,
//                      ),
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Container(
//                    child: Draggable<Color>(
//                      data: blue,
//                      child: Container(
//                        height: 50,
//                        width: 50,
//                        color: blue,
//                      ),
//                      childWhenDragging: Container(),
//                      feedback: Container(
//                        height: 50,
//                        width: 50,
//                        color: blue,
//                      ),
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Container(
//                    child: Draggable<Color>(
//                      data: yellow,
//                      child: Container(
//                        height: 50,
//                        width: 50,
//                        color: yellow,
//                      ),
//                      childWhenDragging: Container(),
//                      feedback: Container(
//                        height: 50,
//                        width: 50,
//                        color: yellow,
//                      ),
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Container(
//                    child: Draggable<Color>(
//                      data: gray,
//                      child: Container(
//                        height: 50,
//                        width: 50,
//                        color: gray,
//                      ),
//                      childWhenDragging: Container(),
//                      feedback: Container(
//                        height: 50,
//                        width: 50,
//                        color: gray,
//                      ),
//                    ),
//                  ),
//                ),

                ),
          ],
        ),
      ),
    );
  }
}
