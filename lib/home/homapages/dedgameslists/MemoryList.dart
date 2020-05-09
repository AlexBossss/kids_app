import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryList extends StatelessWidget {
  final _listItems = <Widget>[
    ListTile(
      leading: Icon(Icons.cloud),
      title: Text('Game 1'),
      subtitle: Text('Description for game one'),
    ),
    ListTile(
      leading: Icon(Icons.panorama),
      title: Text('Game 2'),
      subtitle: Text('Description for game two'),
    ),
    ListTile(
      leading: Icon(Icons.dashboard),
      title: Text('Game 3'),
      subtitle: Text('Description for game three'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: _listItems),
    );
  }
}