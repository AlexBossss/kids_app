import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/TabBarPage.dart';

import 'dedgameslists/ConsiderationList.dart';
import 'dedgameslists/LogicList.dart';
import 'dedgameslists/MemoryList.dart';

class DeductiveGamePage extends StatelessWidget {
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
