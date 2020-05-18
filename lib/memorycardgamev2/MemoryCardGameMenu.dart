import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MemoryCardEnums.dart';
import 'MemoryCardGame.dart';

class MemoryCardGameMenu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<MemoryCardGameMenu> {
  bool _isHard = true;
  bool _isMid = false;
  bool _isEasy = false;

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
    if (_isHard == true) {
      return Level.Hard;
    } else if (_isMid == true) {
      return Level.Medium;
    } else {
      return Level.Easy;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Color gradientStart = Color(0xFFF3D1FF); //Change start gradient color here
  Color gradientEnd = Color(0xFF93EBFF);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [gradientStart, gradientEnd],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          //stops: [0.0, 1.0],
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Text',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(Level.Hard.toString().split('.').last),
                    Switch(
                      onChanged: (bool value) {
                        setState(() => {
                              this._isHard = value,
                              this._isEasy = false,
                              this._isMid = false
                            });
                      },
                      value: this._isHard,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(Level.Medium.toString().split('.').last),
                    Switch(
                      onChanged: (bool value) {
                        setState(() => {
                              this._isMid = value,
                              this._isHard = false,
                              this._isEasy = false
                            });
                      },
                      value: this._isMid,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(Level.Easy.toString().split('.').last),
                    Switch(
                      onChanged: (bool value) {
                        setState(() => {
                              this._isEasy = value,
                              this._isHard = false,
                              this._isMid = false
                            });
                      },
                      value: this._isEasy,
                    ),
                  ],
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
                          MaterialPageRoute(
                              builder: (context) => MemoryGame(_level, _kind)));
                      print(_kindString);
                      print(_level);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
