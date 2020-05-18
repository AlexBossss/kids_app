import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class TabBarPage extends StatelessWidget {
  final _tabs;
  final _pages;
  final String _title;
  final Color color;

  TabBarPage(this._tabs, this._pages, this._title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            //labelColor: Colors.black,
            backgroundColor: (color),
            // title: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(_title),
            //       //place for preferencesMenu
            //     ]),
            title: TabBar(
              //isScrollable: true,
              indicatorColor: Colors.black,

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
