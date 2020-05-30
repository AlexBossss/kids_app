import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/rememberoneitem/Data.dart';

class RememberOneItemRound extends StatefulWidget {
  @override
  _RememberOneItemRoundState createState() => _RememberOneItemRoundState();
}

class _RememberOneItemRoundState extends State<RememberOneItemRound> {
  List<String> _data;
  List<GlobalKey<FlipCardState>> _cardStateKeys;

  @override
  void initState() {
    _cardStateKeys = getKeys();
    _data = getData();
//    _random = Random();
    super.initState();
  }

//  int _random;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Wrap(
            children: _data
                .map((e) => Container(
                    height: 100,
                    child: FlipCard(
                        key: _cardStateKeys[_data.indexOf(e)],
                        front: Image.asset(e),
                        back: Image.asset(missing))))
                .toList(),
          ),
          GestureDetector(
            onTap:() => _cardStateKeys[1].currentState.toggleCard(),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 200,
              child: Text('Pidr'),
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
