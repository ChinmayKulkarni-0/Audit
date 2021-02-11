// import 'package:flutter/material.dart';

// class BottomButton extends StatefulWidget {
//   @override
//   _BottomButtonState createState() => _BottomButtonState();
// }

// class _BottomButtonState extends State<BottomButton>
//     with SingleTickerProviderStateMixin {
//   AnimationController animationController;
//   Animation degOneTranslationAnimation,
//       degTwoTranslationAnimation,
//       degThreeTranslationAnimation;
//   Animation rotationAnimation;

//   double getRadiansFromDegree(double degree) {
//     double unitRadian = 57.295779513;
//     return degree / unitRadian;
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 250));
//     degOneTranslationAnimation = TweenSequence([
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
//     ]).animate(animationController);
//     degTwoTranslationAnimation = TweenSequence([
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
//     ]).animate(animationController);
//     degThreeTranslationAnimation = TweenSequence([
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
//       TweenSequenceItem<double>(
//           tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
//     ]).animate(animationController);
//     rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
//         CurvedAnimation(parent: animationController, curve: Curves.easeOut));
//     super.initState();
//     animationController.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: Container(
//       width: size.width,
//       height: size.height,
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//               right: 30,
//               bottom: 30,
//               child: Stack(
//                 alignment: Alignment.bottomRight,
//                 children: <Widget>[
//                   IgnorePointer(
//                     child: Container(
//                       color: Colors.transparent,
//                       height: 150.0,
//                       width: 150.0,
//                     ),
//                   ),
//                   Transform.translate(
//                     offset: Offset.fromDirection(getRadiansFromDegree(270),
//                         degOneTranslationAnimation.value * 100),
//                     child: Transform(
//                       transform: Matrix4.rotationZ(
//                           getRadiansFromDegree(rotationAnimation.value))
//                         ..scale(degOneTranslationAnimation.value),
//                       alignment: Alignment.center,
//                       child: CircularButton(
//                         color: Colors.blue,
//                         width: 50,
//                         height: 50,
//                         icon: Icon(
//                           Icons.add,
//                           color: Colors.white,
//                         ),
//                         onClick: () {
//                           print('First Button');
//                         },
//                       ),
//                     ),
//                   ),
//                   Transform.translate(
//                     offset: Offset.fromDirection(getRadiansFromDegree(225),
//                         degTwoTranslationAnimation.value * 100),
//                     child: Transform(
//                       transform: Matrix4.rotationZ(
//                           getRadiansFromDegree(rotationAnimation.value))
//                         ..scale(degTwoTranslationAnimation.value),
//                       alignment: Alignment.center,
//                       child: CircularButton(
//                         color: Colors.black,
//                         width: 50,
//                         height: 50,
//                         icon: Icon(
//                           Icons.camera_alt,
//                           color: Colors.white,
//                         ),
//                         onClick: () {
//                           print('Second button');
//                         },
//                       ),
//                     ),
//                   ),
//                   Transform.translate(
//                     offset: Offset.fromDirection(getRadiansFromDegree(180),
//                         degThreeTranslationAnimation.value * 100),
//                     child: Transform(
//                       transform: Matrix4.rotationZ(
//                           getRadiansFromDegree(rotationAnimation.value))
//                         ..scale(degThreeTranslationAnimation.value),
//                       alignment: Alignment.center,
//                       child: CircularButton(
//                         color: Colors.orangeAccent,
//                         width: 50,
//                         height: 50,
//                         icon: Icon(
//                           Icons.person,
//                           color: Colors.white,
//                         ),
//                         onClick: () {
//                           print('Third Button');
//                         },
//                       ),
//                     ),
//                   ),
//                   Transform(
//                     transform: Matrix4.rotationZ(
//                         getRadiansFromDegree(rotationAnimation.value)),
//                     alignment: Alignment.center,
//                     child: CircularButton(
//                       color: Colors.red,
//                       width: 60,
//                       height: 60,
//                       icon: Icon(
//                         Icons.menu,
//                         color: Colors.white,
//                       ),
//                       onClick: () {
//                         if (animationController.isCompleted) {
//                           animationController.reverse();
//                         } else {
//                           animationController.forward();
//                         }
//                       },
//                     ),
//                   )
//                 ],
//               ))
//         ],
//       ),
//     ));
//   }
// }

// class CircularButton extends StatelessWidget {
//   final double width;
//   final double height;
//   final Color color;
//   final Icon icon;
//   final Function onClick;

//   CircularButton(
//       {this.color, this.width, this.height, this.icon, this.onClick});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//       width: width,
//       height: height,
//       child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
//     );
//   }
// }

// import 'package:creiv/LoginPage/screens/Register.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class SplashScreen extends StatefulWidget {
//   static const String id = 'SplashScreen';
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.asset("assets/img/Splash.json"),
//             SizedBox(
//               height: 100,
//             ),
//             Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.arrow_forward,
//                   color: Colors.white,
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:creiv/LoginPage/screens/Login.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 6));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: LoginScreen()));
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: FadeAnimation(
                  1,
                  Container(
                    width: width,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/one.png'),
                            fit: BoxFit.cover)),
                  )),
            ),
            Positioned(
              top: -100,
              left: 0,
              child: FadeAnimation(
                  1.3,
                  Container(
                    width: width,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/one.png'),
                            fit: BoxFit.cover)),
                  )),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation(
                  1.6,
                  Container(
                    width: width,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/img/one.png'),
                            fit: BoxFit.cover)),
                  )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.only(
                  top: 100,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Welcome",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    FadeAnimation(
                        1.3,
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "We promis that you'll have the most \nfuss-free time with us ever.",
                            style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                height: 1.4,
                                fontSize: 20),
                          ),
                        )),
                    SizedBox(
                      height: 50,
                    ),
                    Lottie.asset("assets/img/Splash.json"),
                    SizedBox(
                      height: 40,
                    ),
                    FadeAnimation(
                        2,
                        AnimatedBuilder(
                          animation: _scaleController,
                          builder: (context, child) => Transform.scale(
                              scale: _scaleAnimation.value,
                              child: Center(
                                child: AnimatedBuilder(
                                  animation: _widthController,
                                  builder: (context, child) => Container(
                                    width: _widthAnimation.value,
                                    height: 80,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80),
                                        color: Colors.blue.withOpacity(.4)),
                                    child: InkWell(
                                      onTap: () {
                                        _scaleController.forward();
                                      },
                                      child: Stack(children: <Widget>[
                                        AnimatedBuilder(
                                          animation: _positionController,
                                          builder: (context, child) =>
                                              Positioned(
                                            left: _positionAnimation.value,
                                            child: AnimatedBuilder(
                                              animation: _scale2Controller,
                                              builder: (context, child) =>
                                                  Transform.scale(
                                                      scale: _scale2Animation
                                                          .value,
                                                      child: Container(
                                                        width: 60,
                                                        height: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .blue),
                                                        child: hideIcon == false
                                                            ? Icon(
                                                                Icons
                                                                    .arrow_forward,
                                                                color: Colors
                                                                    .white,
                                                              )
                                                            : Container(),
                                                      )),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                              )),
                        )),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -130.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
