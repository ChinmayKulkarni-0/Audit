class Song {
  final String songName;
  final String artist;
  final String image;
  final int id;

  Song({this.id, this.songName, this.artist, this.image});
}

List<Song> songs = [
  Song(
      id: 1,
      songName: 'Back to Life',
      image: "assets/img/2.png",
      artist: 'DubVision'),
  Song(
      id: 2,
      songName: 'Help me lose my mind',
      image: "assets/img/2.png",
      artist: 'Disclosure'),
  Song(
      id: 3,
      songName: 'A million dreams',
      image: "assets/img/2.png",
      artist: 'Ziv Zaifman'),
  Song(
      id: 4,
      songName: 'Treat you better',
      image: "assets/img/2.png",
      artist: 'Paperwhite'),
  Song(id: 5, songName: 'Let it go', image: "assets/img/2.png", artist: 'Demi'),
  Song(
      id: 6,
      songName: 'Found you',
      image: "assets/img/2.png",
      artist: 'Austin'),
  Song(
      id: 7,
      songName: 'Shallow',
      image: "assets/img/2.png",
      artist: 'Lady Gaga'),
  Song(
      id: 8,
      songName: 'Photograph',
      image: "assets/img/2.png",
      artist: 'Peter'),
];
