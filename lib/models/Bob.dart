import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bob extends StatefulWidget {
  @override
  BobState createState() => BobState();
}

class BobState extends State<Bob> {
  static String _bobAnimation;

  @override
  void initState() {
    _bobAnimation = 'Stand';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<BobData>(context, listen: false).changeAnimation('Jump'),
      child: Container(
        child: FlareActor(
          'assets/Bob.flr',
          animation: Provider.of<BobData>(context).animation,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class BobData extends ChangeNotifier {
  String _animation = 'Stand';

  String get animation => _animation;

  void changeAnimation(String newAnimation) {
    _animation = newAnimation;
    notifyListeners();
    _revertAnimation();
  }

  void _revertAnimation() {
    if (_animation != 'Stand') {
      Future.delayed(Duration(milliseconds: 5600),
          () => {_animation = 'Stand', notifyListeners()});
    }
  }
}
