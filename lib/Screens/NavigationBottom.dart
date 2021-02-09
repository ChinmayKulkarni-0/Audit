import 'package:creiv/Screens/Discover.dart';
import 'package:creiv/Screens/Profile.dart';

import 'package:creiv/Screens/Search_page.dart';
import 'package:creiv/Theme/Theme_Page.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  int _selectedIndex = 2;

  var currentlyPlaying;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  Widget _createPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        return HomePage();
        break;

      case 1:
        return SearchPage();
        break;

      case 2:
        return ThemePage();
        break;

      // case 3:
      //   return BrowsePage();
      //   break;

      // case 3:
      //   return Player();
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData.dark().copyWith(primaryColor: Color(0xff090b11)),
        child: BottomNavigationBar(
          elevation: 30,
          type: BottomNavigationBarType.fixed,
          // unselectedItemColor: Colors.blue,
          backgroundColor: Colors.transparent,
          selectedItemColor: Color(0xffe8e8e8),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                size: 15,
              ),
              activeIcon: Icon(FontAwesomeIcons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                FontAwesomeIcons.search,
                size: 15,
              ),
              activeIcon: Icon(FontAwesomeIcons.search),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                FontAwesomeIcons.heartbeat,
                size: 15,
              ),
              activeIcon: Icon(FontAwesomeIcons.heartbeat),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                FontAwesomeIcons.clone,
                size: 15,
              ),
              activeIcon: Icon(FontAwesomeIcons.solidClone),
            ),
            BottomNavigationBarItem(
                label: "",
                icon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Profile.id);
                  },
                  icon: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80")),
                ))
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: _createPage(context, _selectedIndex),
    );
  }
}
