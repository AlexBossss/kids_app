import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:kidsapp/home/homapages/DeductiveGamePage.dart';

class TabBarPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final _Tabs;
  final _Pages;
  String _title;
  List<MaterialColor> color;

  TabBarPage(
    this._Tabs,
    this._Pages,
    String providedTitle,
    List<MaterialColor> color,
  ) {
    this._title = providedTitle;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: _Tabs.length,
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
