import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class TabBarPage extends StatelessWidget {
  final _tabs;
  final _pages;
  final String _title;
  final List<MaterialColor> color;

  TabBarPage(this._tabs, this._pages, this._title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: GradientAppBar(
            gradient: LinearGradient(colors: color),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_title),
                  //place for preferencesMenu
                ]),
            bottom: TabBar(
              //isScrollable: true,
              indicatorColor: Colors.white,
              tabs: _tabs,
            ),
          ),
          body: TabBarView(
            children: _pages,
          ),
        ),
      ),
    );
  }
}
