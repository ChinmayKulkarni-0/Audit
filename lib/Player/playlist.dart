class Playlist {
  final String playlistName;
  final String image;
  final int id;

  Playlist({this.id, this.playlistName, this.image});
}

List<Playlist> playlists = [
  Playlist(
    id: 1,
    playlistName: 'Party',
    image: "assets/img/1.png",
  ),
  Playlist(
    id: 2,
    playlistName: 'Peace',
    image: "assets/img/2.png",
  ),
  Playlist(
    id: 3,
    playlistName: 'Flutter Time',
    image: "assets/img/3.png",
  ),
  Playlist(
    id: 4,
    playlistName: 'Romance',
    image: "assets/img/4.png",
  ),
];
