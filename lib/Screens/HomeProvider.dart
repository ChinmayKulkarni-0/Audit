import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:creiv/Screens/Profile.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as prefix0;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicApp extends StatefulWidget {
  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  bool _isBlurred = false;
  double _sigmaX = 5; // from 0-10
  double _sigmaY = 5; // from 0-10
  double _opacity = 0.5; // from 0-1.0
  bool playing = false; // at the begining we are not playing any song
  IconData playBtn = Icons.play_arrow;
  bool onpressed = false;
  IconData heart =
      FontAwesomeIcons.heart; // the main state of the play button icon

  //Now let's start by creating our music player
  //first let's declare some object
  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  //we will create a custom slider

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  //Now let's initialize our player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //now let's handle the audioplayer time

    //this function will allow you to get the music duration
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    //this function will allow us to move the cursor of the slider while we are playing the song
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
              title: Text(""),
              leading: GestureDetector(
                onTap: () {/* Write listener code here */},
                child: Icon(
                  Icons.menu, // add custom icons also
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (bCtx) {
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Profile(),
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.more_vert,
                      size: 26.0,
                    ),
                  ),
                ),
              ]),

          // title: Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: IconButton(
          //     icon: Icon(Icons.settings),
          //     iconSize: 20,
          //     onPressed: () {
          //       showModalBottomSheet(
          //         context: context,
          //         builder: (bCtx) {
          //           return GestureDetector(
          //             // behavior: HitTestBehavior.opaque,
          //             child: MusicApp(),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),

          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/img/backdround.jpg"),
                  )),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                    child: Container(
                      color: Colors.black.withOpacity(_opacity),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/img/1.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Artist Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Song Name"),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //Let's start by adding the controller
                      //let's add the time indicator text

                      Container(
                        width: 800.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                            slider(),
                            Text(
                              "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 30.0,
                            onPressed: () {
                              //here we will add the functionality of the play button
                              if (!onpressed) {
                                //now let's play the song
                                setState(() {
                                  heart = FontAwesomeIcons.heart;

                                  playing = true;
                                });
                              } else {
                                setState(() {
                                  heart = FontAwesomeIcons.heartBroken;
                                  playing = false;
                                });
                              }
                            },
                            icon: Icon(
                              heart,
                            ),
                          ),
                          Container(
                            width: 20,
                          ),
                          IconButton(
                            iconSize: 35.0,
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_previous,
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: IconButton(
                                iconSize: 30.0,
                                onPressed: () {
                                  //here we will add the functionality of the play button
                                  if (!playing) {
                                    //now let's play the song
                                    cache.play("img/Alan.mp3");
                                    setState(() {
                                      playBtn = Icons.pause;

                                      playing = true;
                                    });
                                  } else {
                                    _player.pause();
                                    setState(() {
                                      playBtn = Icons.play_arrow;
                                      playing = false;
                                    });
                                  }
                                },
                                icon: Icon(
                                  playBtn,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            iconSize: 35.0,
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_next,
                            ),
                          ),
                          Container(
                            width: 20,
                          ),
                          IconButton(
                            iconSize: 20.0,
                            onPressed: () {},
                            icon: Icon(
                              Icons.headset,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ]),
        )
      ],
    );
  }
}

//we will need some variables
// bool playing = false; // at the begining we are not playing any song
// IconData playBtn = Icons.play_arrow; // the main state of the play button icon

// //Now let's start by creating our music player
// //first let's declare some object
// AudioPlayer _player;
// AudioCache cache;

// Duration position = new Duration();
// Duration musicLength = new Duration();

// //we will create a custom slider

// Widget slider() {
//   return Container(
//     width: 300.0,
//     child: Slider.adaptive(
//         activeColor: Colors.blue[800],
//         inactiveColor: Colors.grey[350],
//         value: position.inSeconds.toDouble(),
//         max: musicLength.inSeconds.toDouble(),
//         onChanged: (value) {
//           seekToSec(value.toInt());
//         }),
//   );
// }

// //let's create the seek function that will allow us to go to a certain position of the music
// void seekToSec(int sec) {
//   Duration newPos = Duration(seconds: sec);
//   _player.seek(newPos);
// }

// //Now let's initialize our player
// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   _player = AudioPlayer();
//   cache = AudioCache(fixedPlayer: _player);

//   //now let's handle the audioplayer time

//   //this function will allow you to get the music duration
//   _player.durationHandler = (d) {
//     setState(() {
//       musicLength = d;
//     });
//   };

//   //this function will allow us to move the cursor of the slider while we are playing the song
//   _player.positionHandler = (p) {
//     setState(() {
//       position = p;
//     });
//   };
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //let's start by creating the main UI of the app
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Colors.blue[800],
//                 Colors.blue[200],
//               ]),
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(
//             top: 48.0,
//           ),
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //Let's add some text title
//                 Padding(
//                   padding: const EdgeInsets.only(left: 12.0),
//                   child: Text(
//                     "Music Beats",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 38.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 12.0),
//                   child: Text(
//                     "Listen to your favorite Music",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 //Let's add the music cover
//                 Center(
//                   child: Container(
//                     width: 280.0,
//                     height: 280.0,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30.0),
//                         image: DecorationImage(
//                           image: AssetImage("assets/img/google.jpg"),
//                         )),
//                   ),
//                 ),

//                 SizedBox(
//                   height: 18.0,
//                 ),
//                 Center(
//                   child: Text(
//                     "Stargazer",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 32.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//     SizedBox(
//       height: 30.0,
//     ),
//     Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30.0),
//             topRight: Radius.circular(30.0),
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             //Let's start by adding the controller
//             //let's add the time indicator text

//             Container(
//               width: 500.0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "${position.inMinutes}:${position.inSeconds.remainder(60)}",
//                     style: TextStyle(
//                       fontSize: 18.0,
//                     ),
//                   ),
//                   slider(),
//                   Text(
//                     "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
//                     style: TextStyle(
//                       fontSize: 18.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 IconButton(
//                   iconSize: 45.0,
//                   color: Colors.blue,
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.skip_previous,
//                   ),
//                 ),
//                 IconButton(
//                   iconSize: 62.0,
//                   color: Colors.blue[800],
//                   onPressed: () {
//                     //here we will add the functionality of the play button
//                     if (!playing) {
//                       //now let's play the song
//                       cache.play("img/Alan.mp3");
//                       setState(() {
//                         playBtn = Icons.pause;
//                         playing = true;
//                       });
//                     } else {
//                       _player.pause();
//                       setState(() {
//                         playBtn = Icons.play_arrow;
//                         playing = false;
//                       });
//                     }
//                   },
//                   icon: Icon(
//                     playBtn,
//                   ),
//                 ),
//                 IconButton(
//                   iconSize: 45.0,
//                   color: Colors.blue,
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.skip_next,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     ),
//   ],
// ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class HorizontalImages extends StatefulWidget {
  @override
  _HorizontalImagesState createState() => _HorizontalImagesState();
}

class _HorizontalImagesState extends State<HorizontalImages> {
  List<String> _imageList = [
    "assets/img/Alan.mp3",
    "assets/img/food2.png",
    "assets/img/food3.png",
    "assets/img/food4.png",
    "assets/img/food5.png",
    "assets/img/food6.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _imageList.length,
        itemBuilder: (BuildContext cotext, int index) {
          return Container(
            width: 250.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(_imageList[index])),
          );
        },
      ),
    );
  }
}
