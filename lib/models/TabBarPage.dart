import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:kidsapp/src/theme/color/light_color.dart';

class TabBarPage extends StatelessWidget {
  final _tabs;
  final _pages;
  final String _title;
  final Color color;

  TabBarPage(this._tabs, this._pages, this._title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: _tabs.length,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: LightColor.homeBackgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 100.0),
                  //top: 50.0,
                  child: TabBarView(
                    children: _pages,
                  ),
                ),
                Container(
                  child: TopBarColor(),
                ),
                Positioned(
                  top: 40.0,
                  left: 0.0,
                  right: 0.0,
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(80.0),
                          bottomLeft: const Radius.circular(10.0)),
                      color: Color(0xFF878EE8),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: _tabs,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopBarColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 150.0,
      ),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path = Path();
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
        size.width * 0.40, size.height * 0.70);

    path.quadraticBezierTo(
        size.width * 0.7, size.height * 0.85, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Color(0xFF7178D3);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
