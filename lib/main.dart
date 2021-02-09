import 'package:creiv/LoginPage/screens/Register.dart';
import 'package:creiv/Screens/Discover.dart';

import 'package:creiv/Screens/Search_page.dart';
import 'package:creiv/Theme/Animation.dart';
import 'package:creiv/Theme/Theme_Page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'LoginPage/screens/Login.dart';
import 'LoginPage/screens/services/auth_bloc.dart';
import 'NavigationBottom.dart';
import 'Screens/Profile.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'Theme/Theme_Provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  final settings = await Hive.openBox('settings');
  bool isLightTheme = settings.get('isLightTheme') ?? false;

  print(isLightTheme);

  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(isLightTheme: isLightTheme),
    child: AppStart(),
  ));
}

class AppStart extends StatelessWidget {
  const AppStart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MyApp(
      themeProvider: themeProvider,
    );
  }
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  final ThemeProvider themeProvider;

  const MyApp({Key key, @required this.themeProvider}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthBloc(),
      // child: ChangeNotifierProvider(
      //   create: (context) => ThemeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Creiv',
        theme: widget.themeProvider.themeData(),
        initialRoute: LoginScreen.id,
        routes: {
          ThemeProvider.id: (context) => ThemePage(),
          ThemePage.id: (context) => ThemePage(),
          ZAnimatedToggle.id: (context) => ZAnimatedToggle(),
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
