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

  Color gradientStart = Color(0xFFF3D1FF); //Change start gradient color here
  Color gradientEnd = Color(0xFF93EBFF); //Change end gradient color here

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [gradientStart, gradientEnd],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          //stops: [0.0, 1.0],
        ),
      ),
      child: Scaffold(
        body: _homePages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black87,
          backgroundColor: Colors.white,
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
      ),
    );
  }
}
