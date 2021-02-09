import 'package:creiv/LoginPage/screens/Register.dart';
import 'package:creiv/Screens/Home_Page.dart';

import 'package:creiv/Screens/Search_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'LoginPage/screens/Login.dart';
import 'LoginPage/screens/services/auth_bloc.dart';
import 'Screens/Home.dart';
import 'Screens/Profile.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Creiv',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.muliTextTheme(),
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
          ),
        ),
        initialRoute: LoginScreen.id,
        routes: {
          Register.id: (context) => Register(),
          LoginScreen.id: (context) => LoginScreen(),
          Home.id: (context) => Home(),
          HomePage.id: (context) => HomePage(),
          SearchPage.id: (context) => SearchPage(),
          Profile.id: (context) => Profile(),
        },
      ),
    );
  }
}
