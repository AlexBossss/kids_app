
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/remembercardgame/Data.dart';
import 'package:kidsapp/games/remembercardgame/RememberCard.dart';

class RememberCardRound extends StatefulWidget {
  final int amountOfSearchItems;

  RememberCardRound({this.amountOfSearchItems});

  @override
  _RememberCardRoundState createState() =>
      _RememberCardRoundState(amountOfSearchItems: amountOfSearchItems);
}

class _RememberCardRoundState extends State<RememberCardRound> {

  List<String> _searchItems;
  bool _action;
  List<String> _data;
  List<bool> _isDone;

  int amountOfSearchItems;

  _RememberCardRoundState({this.amountOfSearchItems});

  List<String> getSearchItems(int amount) {
    _data.shuffle();
    List<String> items = [];
    for (int i = 0; i < amount; i++) {
      items.add(_data[i]);
    }
    items.shuffle();
    return items;
  }

  List<Widget> getSearchItemPic() {
    List<Widget> searchItemPic = [];
    _searchItems.forEach((element) {
      searchItemPic.add(
        Container(
          height: 100,
          child: Image.asset(element),
        ),
      );
    });
    return searchItemPic;
  }

  List<bool> getIsDoneList(List data) {
    List<bool> isDone = [];
    data.forEach((element) {
      isDone.add(false);
    });
    return isDone;
  }

  @override
  void initState() {

    _action = false;
    _data = getData();
    _searchItems = getSearchItems(amountOfSearchItems);
    _isDone = getIsDoneList(_data);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _action
        ? Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) => FlipCard(
                    onFlip: () {
                      if (_searchItems
                          .any((element) => element == _data[index])) {
                        setState(() {
                          _isDone[index] = true;
                        });
                        if (_isDone
                                .where((element) => element == true)
                                .toList()
                                .length ==
                            amountOfSearchItems) {
                          RememberCardState().nextRound();
                          print('found');
                        }
                      }
                      print(_isDone[index]);
                    },
                    flipOnTouch: (_searchItems
                            .any((element) => element == _data[index]) &&
                        !_isDone[index]),
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      margin: EdgeInsets.all(10.0),
                      child: Image.asset(_data[index]),
                    ),
                    back: Container(
                      margin: EdgeInsets.all(10.0),
                      child: Image.asset(correct),
                    ),
                  ),
                  itemCount: _data.length,
                ),
              ),
            ),
          )
        : Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Wrap(
                    children: getSearchItemPic(),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _action = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        "Go",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
