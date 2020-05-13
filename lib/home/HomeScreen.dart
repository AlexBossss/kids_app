import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/home/homapages/DeductiveGamePage.dart';
import 'package:kidsapp/home/homapages/LessonPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  final _homePages = [
    DeductiveGamePage(),
    LessonPage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homePages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            title: Text('Deductive games'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Lessons'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
