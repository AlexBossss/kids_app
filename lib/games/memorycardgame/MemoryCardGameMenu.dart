import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MemoryCardEnums.dart';
import 'MemoryCardGame.dart';

class MemoryCardGameMenu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<MemoryCardGameMenu> {
  bool _isHard;
  bool _isMid;
  bool _isEasy;

  Level _level = Level.Hard;

  String _kindString = Kind.Animals.toString().split('.').last;

  Kind _kind;

  Kind checkKind() {
    if (_kindString == 'Animals') {
      return Kind.Animals;
    } else {
      return Kind.Numbers;
    }
  }

  static const List<String> kinds = <String>['Animals', 'Numbers'];

  final List<DropdownMenuItem<String>> _dropDownMenuItems = kinds
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  Level checkLevel() {
    if (isSelected[2] == true) {
      return Level.Hard;
    } else if (isSelected[1] == true) {
      return Level.Medium;
    } else {
      return Level.Easy;
    }
  }

  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false, false];
    super.initState();
    // _isHard = false;
    // _isMid = false;
    // _isEasy = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Memory',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ToggleButtons(
                    selectedColor: Colors.orange,
                    children: <Widget>[
                      Icon(
                        Icons.star_half,
                        size: 80.0,
                      ),
                      Icon(
                        Icons.star,
                        size: 80.0,
                      ),
                      Icon(
                        Icons.stars,
                        size: 80.0,
                      ),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected[buttonIndex] = true;
                          } else {
                            isSelected[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: isSelected,
                  ),
                ],

                //   <Widget>[
                //     Text(Level.Hard.toString().split('.').last),
                //     Switch(
                //       onChanged: (bool value) {
                //         setState(() => {
                //               this._isHard = value,
                //               this._isEasy = false,
                //               this._isMid = false
                //             });
                //       },
                //       value: this._isHard,
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text(Level.Medium.toString().split('.').last),
                //     Switch(
                //       onChanged: (bool value) {
                //         setState(() => {
                //               this._isMid = value,
                //               this._isHard = false,
                //               this._isEasy = false
                //             });
                //       },
                //       value: this._isMid,
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text(Level.Easy.toString().split('.').last),
                //     Switch(
                //       onChanged: (bool value) {
                //         setState(() => {
                //               this._isEasy = value,
                //               this._isHard = false,
                //               this._isMid = false
                //             });
                //       },
                //       value: this._isEasy,
                //     ),
                //   ],
              ),
              ListTile(
                title: Text('Card:'),
                trailing: DropdownButton(
                  value: _kindString,
                  onChanged: (String newKind) {
                    setState(() {
                      _kindString = newKind;
                    });
                  },
                  items: _dropDownMenuItems,
                ),
              ),
              RaisedButton(
                  padding: const EdgeInsets.all(24.0),
                  child: Text('Start'),
                  onPressed: () {
                    _level = checkLevel();
                    _kind = checkKind();
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: Duration(seconds: 1),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation,
                                Widget child) {
                              return ScaleTransition(
                                alignment: Alignment.center,
                                scale: animation,
                                child: child,
                              );
                            },
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation) {
                              return MemoryGame(_level, _kind);
                            }));
                    print(_kindString);
                    print(_level);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
