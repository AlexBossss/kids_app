import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameItem extends StatelessWidget {
  Color _leftListGradientColor;
  Color _rightListGradientColor;

  GameItem(this._leftListGradientColor, this._rightListGradientColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/newPage');
          print("Container clicked");
        },
        child: Container(
            constraints: BoxConstraints(
              maxWidth: 400.0,
            ),
            padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
            //height: 180.0,
            //color: const Color(0xff0087a8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 110.0,
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            _leftListGradientColor,
                            _rightListGradientColor
                          ]),
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(80.0),
                          bottomLeft: const Radius.circular(10.0))),
                  child: Row(
                    // alignment: AlignmentDirectional.topStart,
                    children: <Widget>[
                      Container(
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'The Memory',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 26.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 230.0,
                              ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Super game for Alex and his brain. You can stay dumb or imrove yourself, You can stay',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 110,
                          width: 110,
                          transform:
                              Matrix4.translationValues(10.0, -30.0, 10.0),
                          color: Colors.transparent,
                          child: Image.asset(
                            'assets/memoryGame.png',
                            fit: BoxFit.fitHeight,
                          )),
                    ],
                  ),
                ),
              ],
            )));
  }
}
