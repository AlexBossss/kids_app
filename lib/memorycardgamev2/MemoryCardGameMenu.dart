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

  Level level;

  Level checkLevel() {
    if (isHard == true) {
      return Level.HARD;
    } else if (isMid == true) {
      return Level.MID;
    } else {
      return Level.EASY;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    level = checkLevel();
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
                  Text('Hard'),
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
                  Text('Medium'),
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
                  Text('Easy'),
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
              RaisedButton(
                  padding: const EdgeInsets.all(24.0),
                  child: Text('Start'),
                  onPressed: () {
                    level = checkLevel();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MemoryGame(level)));

                  }),
            ],
          ),
        ),
      ),
    );
  }
}
