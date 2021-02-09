import 'package:creiv/Screens/HomeProvider.dart';
//import 'package:creiv/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const String id = 'Home_Page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Home",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Featured",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "This Week",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(child: HorizontalImages()),
          SizedBox(
            height: 10,
          ),
          //Container(child: HomeProvider()),

          // Container(child: HomeProvider()),
        ],
      ),
    );
  }
}
