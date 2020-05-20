import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameItem extends StatelessWidget {
  final List<Color> _itemGradient;
  final String _gameTitle;
  final String _gameDesc;
  final String _imgGamePath;
  final String _pageGame;

  GameItem(this._itemGradient, this._gameTitle, this._gameDesc,
      this._imgGamePath, this._pageGame);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, _pageGame);
        },
        child: Container(
            constraints: BoxConstraints(
              maxWidth: 400.0,
            ),
            padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 110.0,
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: _itemGradient,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0),
                        bottomRight: const Radius.circular(80.0),
                        bottomLeft: const Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
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
                              _gameTitle,
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
                                  _gameDesc,
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
                          height: 140,
                          width: 140,
                          transform:
                              Matrix4.translationValues(20.0, -30.0, 10.0),
                          color: Colors.transparent,
                          child: Image.asset(
                            _imgGamePath,
                            //'assets/memoryGame.png',
                            fit: BoxFit.fitHeight,
                          )),
                    ],
                  ),
                ),
              ],
            )));
  }
}
