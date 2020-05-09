import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/TabBarPage.dart';

class DeductiveGamePage extends StatefulWidget {
  @override
  DeductiveGamePageState createState() => DeductiveGamePageState();
}

class DeductiveGamePageState extends State<DeductiveGamePage> {
  final String _title = 'D Games';
  final Color _color = Colors.lightBlue;
  final _dGameTabs = <Tab>[
    Tab(text: 'Memory'),
    Tab(text: 'Logic'),
    Tab(text: 'Consideration'),
  ];
  final _dGamePages = [MemoryList(), LogicList(), ConsiderationList()];

  @override
  Widget build(BuildContext context) {
    return TabBarPage(_dGameTabs, _dGamePages, _title, _color);
  }
}

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

class LogicList extends StatelessWidget {
  final _listItems = <Widget>[
    ListTile(
      leading: Icon(Icons.cloud),
      title: Text('Game 1'),
      subtitle: Text('Description for game one'),
    ),
    ListTile(
      leading: Icon(Icons.access_alarm),
      title: Text('Game 2'),
      subtitle: Text('Description for game two'),
    ),
    ListTile(
      leading: Icon(Icons.save),
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

class ConsiderationList extends StatelessWidget {
  final _listItems = <Widget>[
    ListTile(
      leading: Icon(Icons.language),
      title: Text('Game 1'),
      subtitle: Text('Description for game one'),
    ),
    ListTile(
      leading: Icon(Icons.calendar_today),
      title: Text('Game 2'),
      subtitle: Text('Description for game two'),
    ),
    ListTile(
      leading: Icon(Icons.cloud),
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
