import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MemoryCardEnums.dart';
import 'MemoryCardGame.dart';

class MemoryCardGameMenu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<MemoryCardGameMenu> {
  bool isHard = true;
  bool isMid = false;
  bool isEasy = false;

  Level level = Level.Hard;

  String kindString = Kind.Animals.toString().split('.').last;

  Kind kind;

  Kind checkKind() {
    if (kindString == 'Animals') {
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
    if (isHard == true) {
      return Level.Hard;
    } else if (isMid == true) {
      return Level.Medium;
    } else {
      return Level.Easy;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            this.isHard = value,
                            this.isEasy = false,
                            this.isMid = false
                          });
                    },
                    value: this.isHard,
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
                            this.isMid = value,
                            this.isHard = false,
                            this.isEasy = false
                          });
                    },
                    value: this.isMid,
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
                            this.isEasy = value,
                            this.isHard = false,
                            this.isMid = false
                          });
                    },
                    value: this.isEasy,
                  ),
                ],
              ),
              ListTile(
                title: Text('Card:'),
                trailing: DropdownButton(
                  value: kindString,
                  onChanged: (String newKind) {
                    setState(() {
                      kindString = newKind;
                    });
                  },
                  items: _dropDownMenuItems,
                ),
              ),
              RaisedButton(
                  padding: const EdgeInsets.all(24.0),
                  child: Text('Start'),
                  onPressed: () {
                    level = checkLevel();
                    kind = checkKind();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MemoryGame(level,kind)));
                    print(kindString);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
