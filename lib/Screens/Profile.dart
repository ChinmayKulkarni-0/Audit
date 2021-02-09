import 'dart:async';

import 'package:creiv/LoginPage/screens/Login.dart';
import 'package:creiv/LoginPage/screens/services/auth_bloc.dart';
import 'package:creiv/NavigationBottom.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  static const String id = "Profile";
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  StreamSubscription<User> loginStateSubscription;
  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  List tags = [
    "Travel",
    "Travel",
    "Travel",
    "Travel",
    "Travel",
    "Travel",
    "Travel"
  ];
  List categories = [
    "Travel",
    "Travel",
    "Travel",
    "Travel",
    "Travel",
    "Travel",
    "Travel"
  ];

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Home.id);
          },
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(child: Icon(Icons.more_vert)),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 28.0, top: 7),
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: user.photoURL != null
                        ? NetworkImage(user.photoURL)
                        : AssetImage('gassets/img/google.jpg')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "User",
                      //  user.displayName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 17,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "India-MH",
                              style:
                                  TextStyle(wordSpacing: 2, letterSpacing: 4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 38, left: 38, top: 15, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "10k",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        "Followers",
                      ),
                    ]),
                Container(
                  width: 0.2,
                  height: 22,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "10k",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        "Followers",
                      ),
                    ]),
                Container(
                  width: 0.2,
                  height: 22,
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                          colors: [Color(0xff6D0EB5), Color(0xff4059F1)],
                          begin: Alignment.bottomRight,
                          end: Alignment.centerLeft)),
                  child: Text(
                    "Follow",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 44,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tags.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    margin: EdgeInsets.only(right: 13),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 13.0, bottom: 5, right: 20, left: 20),
                      child: Text(
                        tags[index],
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  //  color: kInactiveCardColour,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 33, right: 25, left: 25),
                    child: Text(
                      "Feeds",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                      ),
                    ),
                  ),
                  SignInButton(Buttons.Google,
                      text: 'Sign Out of Google',
                      onPressed: () => authBloc.logout())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
