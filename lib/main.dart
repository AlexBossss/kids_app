import 'package:flutter/material.dart';
import 'package:kidsapp/home/HomeScreen.dart';

//super app next 1
void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomeScreen(),
      },
    ),
  );
}
