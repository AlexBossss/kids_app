import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kidsapp/home/homapages/DeductiveGamePage.dart';
import 'package:kidsapp/home/homapages/LessonPage.dart';
import 'package:kidsapp/src/theme/color/light_color.dart';
import 'package:ocarina/ocarina.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  AudioCache _audioCache = AudioCache();
  final _homePages = [
    DeductiveGamePage(),
    LessonPage(),
  ];
  static var index = new ValueNotifier(0);
  static bool active = true;
  static bool disable = false;

  OcarinaPlayer player = OcarinaPlayer(loop: true, asset: 'assets/kids.mp3');

  void startPlayer() async {
    await player.load();
    player.play();
  }

  @override
  void initState() {
    startPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: LightColor.homeBackgroundGradient,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ValueListenableBuilder<int>(
            valueListenable: index,
            builder: (context, value, child) {
              return IndexedStack(
                index: index.value,
                children: _homePages,
              );
            }),
        bottomNavigationBar: _getNavBar(context),

        //BottomNavigationBar(
        //   fixedColor: Colors.black87,
        //   backgroundColor: Colors.white,
        //   currentIndex: _currentIndex,
        //   type: BottomNavigationBarType.fixed,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.games),
        //       title: Text('Deductive games'),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.book),
        //       title: Text('Lessons'),
        //     ),
        //   ],
        //   onTap: (index) {
        //     setState(() {
        //       _currentIndex = index;
        //     });
        //   },
        // ),
      ),
    );
  }
}

_getNavBar(context) {
  return Container(
    color: Colors.transparent,
    height: 120,
    child: Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: ClipPath(
            clipper: NavBarClipper(),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFF0BAB64),
                    Color(0xFF07A65F),
                  ])),
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildNavItem(Icons.hotel, 0, HomeState.active),
              SizedBox(width: 1),
              _buildNavItem(Icons.landscape, 1, HomeState.active),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Focus',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500)),
              SizedBox(
                width: 1,
              ),
              Text('Relax',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500)),
            ],
          ),
        )
      ],
    ),
  );
}

_buildNavItem(IconData icon, int pageIndex, bool active) {
  return CircleAvatar(
    radius: 30,
    backgroundColor: Color(0xFF07A65F),
    child: CircleAvatar(
      radius: 25,
      backgroundColor:
          active ? Colors.white.withOpacity(0.3) : Colors.transparent,
      child: IconButton(
        icon: Icon(icon),
        onPressed: () {
          HomeState.index.value = pageIndex;
        },
      ),

      //  Icon(
      //   icon,
      //   color: active ? Colors.black : Colors.white.withOpacity(0.9),
      // ),
    ),
  );
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    print(sw);
    print(sh);

    path.cubicTo(sw / 8, 0, sw / 8, 2 * sh / 5, 2 * sw / 8, 2 * sh / 5);
    path.cubicTo(3 * sw / 8, 2 * sh / 5, 3 * sw / 8, 0, 4 * sw / 8, 0);
    path.cubicTo(5 * sw / 8, 0, 5 * sw / 8, 2 * sh / 5, 6 * sw / 8, 2 * sh / 5);
    path.cubicTo(7 * sw / 8, 2 * sh / 5, 7 * sw / 8, 0, 8 * sw / 8, 0);

    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
