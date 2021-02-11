import 'package:creiv/Player/playlist.dart';
import 'package:creiv/Screens/HomeProvider.dart';
import 'package:flutter/material.dart';

import 'Songslist.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Songs',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 0,
        //backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.account_circle,
              // color: kPrimaryColor,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.72,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavigationRail(),
                  _buildPlaylistAndSongs(size)
                ],
              ),
            ),
          ),
          _buildCurrentPlayingSong(size),
          //_buildBottomBar(size)
        ],
      ),
    );
  }

  Widget _buildCurrentPlayingSong(Size size) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (bCtx) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: MusicApp(),
            );
          },
        );
      },
      child: Container(
        height: size.height * 0.103,
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(
            //  color: kSecondaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0))),
        child: Row(
          children: [
            CircleAvatar(
                radius: 25, backgroundImage: AssetImage('assets/img/3.png')),
            SizedBox(
              width: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rewrite the stars',
                  style: TextStyle(
                      //  color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  'Zac Effron',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Icon(
              Icons.favorite_border,
              //color: kPrimaryColor,
            ),
            SizedBox(width: 10.0),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10.0),
                //color: Colors.white
              ),
              child: Icon(
                Icons.pause,
                //   color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationRail() {
    return NavigationRail(
      minWidth: 50.0,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      groupAlignment: -0.1,
      labelType: NavigationRailLabelType.all,
      selectedLabelTextStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelTextStyle: TextStyle(
          //color: Colors.white,
          fontWeight: FontWeight.bold),
      leading: Column(children: [
        Icon(
          Icons.playlist_play,
          //  color: kPrimaryColor,
        ),
        SizedBox(height: 10.0),
        SingleChildScrollView(
          child: RotatedBox(
            quarterTurns: 100,
            child: CircleAvatar(
                radius: 30, backgroundImage: AssetImage('assets/img/4.png')),
          ),
        ),
      ]),
      destinations: [
        NavigationRailDestination(
          icon: SizedBox.shrink(),
          label: RotatedBox(
            quarterTurns: 100,
            child: CircleAvatar(
                radius: 30, backgroundImage: AssetImage('assets/img/3.png')),
          ),
        ),
        NavigationRailDestination(
          icon: SizedBox.shrink(),
          label: RotatedBox(
            quarterTurns: 100,
            child: CircleAvatar(
                radius: 30, backgroundImage: AssetImage('assets/img/1.png')),
          ),
        ),
        NavigationRailDestination(
          icon: SizedBox.shrink(),
          label: RotatedBox(
            quarterTurns: 100,
            child: CircleAvatar(
                radius: 30, backgroundImage: AssetImage('assets/img/3.png')),
          ),
        ),
        NavigationRailDestination(
          icon: SizedBox.shrink(),
          label: RotatedBox(
            quarterTurns: 100,
            child: CircleAvatar(
                radius: 30, backgroundImage: AssetImage('assets/img/1.png')),
          ),
        ),
        NavigationRailDestination(
          icon: SizedBox.shrink(),
          label: RotatedBox(
            quarterTurns: 100,
            child: CircleAvatar(
                radius: 30, backgroundImage: AssetImage('assets/img/1.png')),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaylistAndSongs(Size size) {
    return Column(
      children: [
        Container(
          height: 0.30 * size.height,
          width: size.width * 0.8,
          //color: Colors.purple,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: playlists.length,
            itemBuilder: (context, index) => _buildPlaylistItem(
                image: playlists[index].image,
                title: playlists[index].playlistName),
          ),
        ),
        Container(
          height: 0.40 * size.height,
          width: size.width * 0.8,
          child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) => _buildSonglistItem(
              image: songs[index].image,
              title: songs[index].songName,
              subtitle: songs[index].artist,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPlaylistItem({String title, String image}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        // color: Colors.blueAccent,
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: TextStyle(
                    //  color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(child: Container(height: 0)),
            Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                // color: Colors.white
              ),
              child: Icon(
                Icons.play_circle_outline,
                //  color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSonglistItem({String image, String title, String subtitle}) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
