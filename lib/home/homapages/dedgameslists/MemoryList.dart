import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/memoryCardGame');
              },
              child:  ListTile(
                leading: Icon(Icons.language),
                title: Text('Game 1'),
                subtitle: Text('Description for game one'),
              ),
            ),

            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/rememberCard');
              },
              child:  ListTile(
                leading: Icon(Icons.panorama),
                title: Text('Game 2'),
                subtitle: Text('Description for game one'),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}