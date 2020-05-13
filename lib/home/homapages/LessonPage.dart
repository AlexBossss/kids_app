import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/models/TabBarPage.dart';

class LessonPage extends StatelessWidget {
  final String _title = 'Lessons';
  final List<MaterialColor> _color = [
    Colors.red,
    Colors.purple,
    Colors.blue,
  ];

  final _lessonTabs = <Tab>[
    Tab(text: 'Numbers'),
    Tab(text: 'Letters'),
    Tab(text: 'Figures'),
  ];

  final _lessonPages = [NumbersList(), LettersList(), FiguresList()];

  @override
  Widget build(BuildContext context) {
    return TabBarPage(_lessonTabs, _lessonPages, _title, _color);
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
