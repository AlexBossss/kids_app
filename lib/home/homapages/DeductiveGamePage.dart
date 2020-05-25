import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/TabBarPage.dart';
import 'dedgameslists/ConsiderationList.dart';
import 'dedgameslists/LogicList.dart';
import 'dedgameslists/MemoryList.dart';

class DeductiveGamePage extends StatelessWidget {
  final String _title = 'D Games';
  final Color _color = Colors.transparent;
  final _dGameTabs = <Tab>[
    Tab(
        child: Text('Memory',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800))),
    Tab(
        child: Text('Logic',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800))),
    Tab(
        child: Text('Attention',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800))),
  ];
  final _dGamePages = [MemoryList(), LogicList(), ConsiderationList()];

  @override
  Widget build(BuildContext context) {
    return TabBarPage(_dGameTabs, _dGamePages, _title, _color);
  }
}
