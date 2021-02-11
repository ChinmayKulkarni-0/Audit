import 'package:creiv/Player/player.dart';
import 'package:creiv/Screens/Discover.dart';
import 'package:creiv/Screens/Profile.dart';

import 'package:creiv/Screens/Search_page.dart';
import 'package:creiv/Theme/Theme_Page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'LoginPage/screens/services/auth_bloc.dart';
import 'Screens/HomeProvider.dart';
import 'Theme/Theme_Provider.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  String username;
  String userId;
  Home({@required this.userId, @required this.username});

  static const String id = "Homepage";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getCategoryData(BuildContext context) async {}

  // int _selectedIndex = 2;

  // var currentlyPlaying;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     print(_selectedIndex);
  //   });
  // }

  // Widget _createPage(BuildContext context, int index) {
  //   switch (index) {
  //     case 0:
  //       return HomePage();
  //       break;

  //     case 1:
  //       return SearchPage();
  //       break;

  //     // case 2:
  //     //   return ThemePage();
  //     //   break;

  //     // case 3:
  //     //   return BrowsePage();
  //     //   break;

  //     // case 3:
  //     //   return Player();
  //     //   break;
  //   }
  // }

  GlobalKey _bottomNavigationKey = GlobalKey();
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    Player(),
    MusicApp()
  ];

  //selection
  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    final user = FirebaseAuth.instance.currentUser;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50,
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Color(0xFF008081),
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Color(0xFF008081),
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Color(0xFF008081),
          ),
          Icon(
            Icons.person_rounded,
            size: 30,
            color: Color(0xFF008081),
          ),
          CircleAvatar(
              radius: 20,
              backgroundImage: user.photoURL != null
                  ? NetworkImage(user.photoURL)
                  : AssetImage('gassets/img/google.jpg')),
        ],

        buttonBackgroundColor:
            themeProvider.isLightTheme ? Colors.white : Colors.white,
        // color: themeProvider.isLightTheme ? Colors.white : Colors.white,
        //    buttonBackgroundColor:Color(0xFF858385),
        backgroundColor: Color(0xFF008081),
        onTap: _onItemSelected,
      ),
      body: Container(
          color: Color(0xFF008081),
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          )),
    );
  }
//       bottomNavigationBar: Theme(
//         data: ThemeData.light().copyWith(primaryColor: Color(0xff090b11)),
//         child: BottomNavigationBar(
//           mouseCursor: MouseCursor.uncontrolled,
//           elevation: 15,
//           type: BottomNavigationBarType.fixed,
//           unselectedItemColor: Colors.blue,
//           backgroundColor: Colors.transparent,
//           selectedItemColor: Color(0xFF8983F7),
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(
//                 FontAwesomeIcons.home,
//                 size: 15,
//               ),
//               activeIcon: Icon(FontAwesomeIcons.home),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               label: "",
//               icon: Icon(
//                 FontAwesomeIcons.search,
//                 size: 15,
//               ),
//               activeIcon: Icon(FontAwesomeIcons.search),
//             ),
//             BottomNavigationBarItem(
//               label: "",
//               icon: Icon(
//                 FontAwesomeIcons.heartbeat,
//                 size: 15,
//               ),
//               activeIcon: Icon(FontAwesomeIcons.heartbeat),
//             ),
//             BottomNavigationBarItem(
//               label: "",
//               icon: Icon(
//                 FontAwesomeIcons.clone,
//                 size: 15,
//               ),
//               activeIcon: Icon(FontAwesomeIcons.solidClone),
//             ),
//             BottomNavigationBarItem(
//                 label: "",
  // icon: IconButton(
  //   onPressed: () {
  //     Navigator.pushNamed(context, Profile.id);
  //   },
  //   icon: CircleAvatar(
  //       radius: 50,
  //       backgroundImage: user.photoURL != null
  //           ? NetworkImage(user.photoURL)
  //           : AssetImage('gassets/img/google.jpg')),
  // )),
//           ],
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
//       body: _createPage(context, _selectedIndex),
//     );
//   }
}
