class Music {
  final String songCover;
  final String artistDP;
  final String artistName;
  final String songName;

  Music({
    required this.songCover,
    required this.artistDP,
    required this.artistName,
    required this.songName,
  });
}

final List<Music> allMusic = [
  Music(
    songCover: "lib/screens/explandableNavBar/assets/Song_1.png",
    artistDP: "lib/screens/explandableNavBar/assets/Artist_1.jpg",
    artistName: "Ed Sheeran",
    songName: "Bad Habits",
  ),
  Music(
    songCover: "lib/screens/explandableNavBar/assets/Song_2.png",
    artistDP: "lib/screens/explandableNavBar/assets/Artist_2.jpg",
    artistName: "Justin Bieber",
    songName: "Ghost",
  ),
  Music(
    songCover: "lib/screens/explandableNavBar/assets/Song_3.jpg",
    artistDP: "lib/screens/explandableNavBar/assets/Artist_3.jpg",
    artistName: "Jonas Blue",
    songName: "Purpose",
  ),
  Music(
    songCover: "lib/screens/explandableNavBar/assets/Song_4.png",
    artistDP: "lib/screens/explandableNavBar/assets/Artist_4.jpg",
    artistName: "Alan Walker",
    songName: "Faded",
  ),
];
