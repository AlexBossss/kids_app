import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/games/rememberoneitem/Data.dart';
import 'package:kidsapp/games/rememberoneitem/RememberOneItemRound.dart';

class RememberOneItem extends StatefulWidget {
  @override
  _RememberOneItemState createState() => _RememberOneItemState();
}

class _RememberOneItemState extends State<RememberOneItem> {

  static var _index;



  void _restart() {
//    _progress = new ValueNotifier(0.0);
    _index = new ValueNotifier(0);
  }


  @override
  void initState() {
    _restart();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              ValueListenableBuilder<int>(
                valueListenable: _index,
                builder: (context, value, child){
                  return IndexedStack(
                    index: _index.value,
                    children: <Widget>[RememberOneItemRound()],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
