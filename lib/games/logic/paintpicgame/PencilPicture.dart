import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class PencilPicture extends StatelessWidget {
 final Color color;

 PencilPicture(this.color);

 @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: SvgPicture.asset(
            'assets/paintpicitems/PencilColor.svg',height: 150,
            color: color,
          ),
        ),
        Container(
          child: SvgPicture.asset(
            'assets/paintpicitems/Pencil.svg',height: 150,
          ),
        ),
      ],
    );
  }
}
