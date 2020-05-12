import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final _Tabs;
  final _Pages;
  String _title;
  Color _color;

  TabBarPage(
      this._Tabs, this._Pages, String providedTitle, Color providedColor) {
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
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_title),
                  //place for preferencesMenu
                ]),
            bottom: TabBar(
              //isScrollable: true,
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
