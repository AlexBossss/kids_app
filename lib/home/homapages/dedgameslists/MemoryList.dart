import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/ListGames.dart';

class MemoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        // RaisedButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/newPage');
        //   },
        //   child: ListTile(
        //     leading: Icon(Icons.language),
        //     title: Text('Game 1'),
        //     subtitle: Text('Description for game one'),
        //   ),
        // ),
        GameItem(Color(0xffFD84FF), Color(0xffF7E1FF)),
        GameItem(Color(0xff7CE7FF), Color(0xffC2E9FF)),
      ]),
    );
  }
}
