import 'dart:async';

import 'package:creiv/LoginPage/screens/services/auth_bloc.dart';
import 'package:creiv/Screens/NavigationBottom.dart';
import 'package:creiv/Theme/Theme_Page.dart';

//import 'package:creiv/constant1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Register.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  StreamSubscription<User> loginStateSubscription;
  bool _rememberMe = false;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ThemePage(),
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

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          //style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              //  hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          // style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              // hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',

          /// style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            // style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          setState(() {
            showSpinner = true;
          });
          try {
            final user = await _auth.signInWithEmailAndPassword(
                email: email, password: password);
            if (user != null) {
              Navigator.pushNamed(context, Home.id);
            }

            setState(() {
              showSpinner = false;
            });
          } catch (e) {
            print(e);
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          //   style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    final authBloc = Provider.of<AuthBloc>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => authBloc.loginGoogle(),
            AssetImage(
              'assets/img/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () => authBloc.loginGoogle(),
            AssetImage(
              'assets/img/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Register())),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// import 'dart:async';

// import 'package:creiv/blocs/screens/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';

// import 'package:provider/provider.dart';

// import '../auth_bloc.dart';

// class LoginScreen extends StatefulWidget {
//   static const String id = "LoginScreen";
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   StreamSubscription<User> loginStateSubscription;

//   @override
//   void initState() {
//     var authBloc = Provider.of<AuthBloc>(context, listen: false);
//     loginStateSubscription = authBloc.currentUser.listen((fbUser) {
//       if (fbUser != null) {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => HomeScreen(),
//           ),
//         );
//       }
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     loginStateSubscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authBloc = Provider.of<AuthBloc>(context);
//     return Scaffold(
//         body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SignInButton(
//             Buttons.Google,
//             onPressed: () => authBloc.loginGoogle(),
//           ),
//         ],
//       ),
//     ));
//   }
// }










// import 'dart:async';

// import 'package:creiv/blocs/auth_bloc.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/button_view.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';

// import 'package:provider/provider.dart';

// import 'Login.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   StreamSubscription<User> loginStateSubscription;

//   @override
//   void initState() {
//     var authBloc = Provider.of<AuthBloc>(context, listen: false);
//     loginStateSubscription = authBloc.currentUser.listen((fbUser) {
//       if (fbUser == null) {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => LoginScreen1(),
//           ),
//         );
//       }
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     loginStateSubscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authBloc = Provider.of<AuthBloc>(context);

//     return Scaffold(
//         body: Center(
//       child: StreamBuilder<User>(
//           stream: authBloc.currentUser,
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) return CircularProgressIndicator();
//             print(snapshot.data.photoURL);
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(snapshot.data.displayName,
//                     style: TextStyle(fontSize: 35.0)),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(
//                       snapshot.data.photoURL.replaceFirst('s96', 's400')),
//                   radius: 60.0,
//                 ),
//                 SizedBox(
//                   height: 100.0,
//                 ),
//                 SignInButton(Buttons.Google,
//                     text: 'Sign Out of Google',
//                     onPressed: () => authBloc.logout())
//               ],
//             );
//           }),
//     ));
//   }
// }
