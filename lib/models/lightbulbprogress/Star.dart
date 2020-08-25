import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';

class Star extends StatefulWidget {


  @override
  _StarState createState() => _StarState();
}

class _StarState extends State<Star> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: FlareActor('assets/Star.flr',animation: 'Glow' ,),
    );
  }
}
