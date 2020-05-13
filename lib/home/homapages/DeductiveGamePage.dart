import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/TabBarPage.dart';

import 'dedgameslists/ConsiderationList.dart';
import 'dedgameslists/LogicList.dart';
import 'dedgameslists/MemoryList.dart';

class DeductiveGamePage extends StatelessWidget {
  final String _title = 'D Games';
  final List<MaterialColor> _color = [Colors.blue, Colors.purple, Colors.red];
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
