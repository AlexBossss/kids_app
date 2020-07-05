import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';

class LightBulb extends StatefulWidget {
 final String _animation;

 LightBulb(this._animation);

  @override
  _LightBulbState createState() => _LightBulbState(_animation);
}

class _LightBulbState extends State<LightBulb> {

  String _animation;

  _LightBulbState(this._animation);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 50,
      child: FlareActor('assets/extraitem/Light.flr',animation: _animation ,),
    );
  }
}
