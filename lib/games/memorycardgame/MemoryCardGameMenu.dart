import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MemoryCardEnums.dart';
import 'MemoryCardGame.dart';

class MemoryCardGameMenu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<MemoryCardGameMenu> {
  Level _level = Level.Hard;

  List<String> selectedCategory = List<String>();

  String animals = 'Animals';
  String numbers = 'Numbers';

  Kind _kind;

  Kind checkKind() {
    if (selectedCategory[0] == 'Animals') {
      return Kind.Animals;
    } else {
      return Kind.Numbers;
    }
  }

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
    selectedCategory = List<String>();
    selectedCategory.add(animals);
    super.initState();
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
                  Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Color(0xFF7178D3),
                      //border: Border.all(color: Color(0xFFE3E9FF), width: 1.0),
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(50.0),
                          topRight: const Radius.circular(5.0),
                          bottomRight: const Radius.circular(50.0),
                          bottomLeft: const Radius.circular(5.0)),
                    ),
                    child: ToggleButtons(
                      fillColor: Color(0xFFFFFFFF),
                      focusColor: Color(0xFF7178D3),
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(50.0),
                          topRight: const Radius.circular(5.0),
                          bottomRight: const Radius.circular(50.0),
                          bottomLeft: const Radius.circular(5.0)),
                      borderWidth: 2,
                      splashColor: Colors.amber,
                      // fillColor: Colors.blue,
                      //highlightColor: Colors.cyan,
                      textStyle: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w300,
                      ),
                      selectedColor: Colors.deepOrange,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              //color: Color(0xFF7178D3),

                              //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              //   border: Border.all(
                              //       color: Colors.white,
                              //       width: 5.0,
                              //       style: BorderStyle.solid),
                              ),
                          child: Column(
                            //mainAxisSize: MainAxisSize.min,
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                //height: 40,
                                width: 120.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      size: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Text("Easy"),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 120.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      size: 30.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                              Text("Normal")
                            ],
                          ),
                        ),
                        Container(
                          width: 120.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      size: 30.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 30.0,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                              Text("Hard")
                            ],
                          ),
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
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 4.0, left: 0.0, right: 0.0, bottom: 6.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 4.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                width: 2.0,
                              ),
                              InkWell(
                                splashColor: Colors.blue[100],
                                onTap: () {
                                  selectedCategory = List<String>();
                                  selectedCategory.add(animals);
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 12.0),
                                  decoration: BoxDecoration(
                                    color: selectedCategory.contains(animals)
                                        ? Colors.blue[100]
                                        : Colors.grey[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(48.0)),
                                  ),
                                  child: Text(
                                    'Животины',
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              InkWell(
                                splashColor: Colors.blue[100],
                                onTap: () {
                                  selectedCategory = new List<String>();
                                  selectedCategory.add(numbers);
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 12.0),
                                  decoration: BoxDecoration(
                                    color: selectedCategory.contains(numbers)
                                        ? Colors.blue[100]
                                        : Colors.grey[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(48.0)),
                                  ),
                                  child: Text(
                                    'Чиселки',
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        )
                      ],
                    ),
                  ),
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
                        builder: (BuildContext context) =>
                            MemoryGame(_level, _kind),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
