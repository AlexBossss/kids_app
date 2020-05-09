import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final _Tabs;
  // ignore: non_constant_identifier_names
  final _Pages;
  final String _title;
  final Color _color;

  TabBarPage(this._Tabs,this._Pages, this._title,this._color);


  @override
  TabBarPageState createState() => TabBarPageState(_Tabs,_Pages,_title,_color);
}

class TabBarPageState extends State<TabBarPage> {
  // ignore: non_constant_identifier_names
  final _Tabs;
  // ignore: non_constant_identifier_names
  final _Pages;
  String _title;
  Color _color;

  TabBarPageState(this._Tabs,this._Pages, String providedTitle,
      Color providedColor) {

    this._title = providedTitle;
    this._color = providedColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: _Tabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: _color,
            title: Text(_title),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: _Tabs,
            ),
          ),
          body: TabBarView(
            children: _Pages,
          ),
        ),
      ),
    );
  }
}
