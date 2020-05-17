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
            padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
            //height: 180.0,
            //color: const Color(0xff0087a8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 130.0,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            _leftListGradientColor,
                            _rightListGradientColor
                          ]),
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(80.0),
                          bottomLeft: const Radius.circular(10.0))),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        'The Memory',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 250.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Super game for Alex and his brain. You can stay dumb or imrove yourself,You can stay dumb or imrove yourself You can stay dumb or imrove yourself',
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                        ),
                      ),

                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: FloatingActionButton(
                      //     heroTag: "btn1",
                      //     backgroundColor: const Color(0xff0087a8),
                      //     onPressed: () {},
                      //     child: Icon(
                      //       Icons.add,
                      //       color: Colors.white,
                      //       size: 50.0,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(-25.0, -150.0, 0.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      heroTag: "btn2",
                      backgroundColor: const Color(0xff0087a8),
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
