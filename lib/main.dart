import 'package:flutter/material.dart';
import 'package:kidsapp/home/HomeScreen.dart';
import 'package:kidsapp/home/NewPage.dart';

//super app next 1
void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        '/newPage' : (BuildContext context) => NewPage(),
      },
    ),
  );
}
