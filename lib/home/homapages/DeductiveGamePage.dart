import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeductiveGamePage extends StatefulWidget {
  @override
  DeductiveGamePageState createState() => DeductiveGamePageState();
}

class DeductiveGamePageState extends State<DeductiveGamePage> {
  final _dGameTabs = <Tab>[
    Tab(text: 'Memory'),
    Tab(text: 'Logic'),
    Tab(text: 'Consideration'),
  ];

  final _dGamePages = [MemoryList(), LogicList(), ConsiderationList()];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: _dGameTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Deductive games'),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: _dGameTabs,
            ),
          ),
          body: TabBarView(
            children: _dGamePages,
          ),
        ),
      ),
    );
  }
}

class MemoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('MemoryList'),
    );
  }
}

class LogicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('LogicList'),
    );
  }
}

class ConsiderationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('ConsiderationList'),
    );
  }
}
