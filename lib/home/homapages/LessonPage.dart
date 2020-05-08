import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonPage extends StatefulWidget {
  @override
  LessonPageState createState() => LessonPageState();
}

class LessonPageState extends State<LessonPage> {
  final _dGameTabs = <Tab>[
    Tab(text: 'Numbers'),
    Tab(text: 'Letters'),
    Tab(text: 'Figures'),
  ];

  final _dGamePages = [NumbersList(), LettersList(), FiguresList()];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: _dGameTabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            title: Text('Lessons'),
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

class NumbersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('NumbersList'),
    );
  }
}

class LettersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('LettersList'),
    );
  }
}

class FiguresList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('FiguresList'),
    );
  }
}
