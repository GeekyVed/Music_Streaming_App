import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  // playlist of songs
  final List<Song> _playlist = [
    //Song 1
    const Song(
      songName: "ColdPlay",
      artistName: "Coldplay Band Co.",
      albumArtImagePath: "assets/images/blocks.png",
      audioPath: "assets/audio/coldplay.mp3",
    ),

    //Song 2
    const Song(
      songName: "Fix You",
      artistName: "Coldplay",
      albumArtImagePath: "assets/images/coldplay.jpeg",
      audioPath: "assets/audio/fixyou.mp3",
    ),

    //Song 3
    const Song(
      songName: "Iilahi",
      artistName: "Coldplay Band Co.",
      albumArtImagePath: "assets/images/illahi.jpeg",
      audioPath: "assets/audio/illahi.mp3",
    ),

    // Song 4
    const Song(
      songName: "ColdPlay",
      artistName: "Coldplay Band Co.",
      albumArtImagePath: "assets/images/sooraj.jpeg",
      audioPath: "assets/audio/sooraj.mp3",
    ),

    const Song(
      songName: "Stairway to Heaven",
      artistName: "Led Zeppelin",
      albumArtImagePath: "assets/images/sooraj.jpeg",
      audioPath: "assets/audio/sooraj.mp3",
    ),
    const Song(
      songName: "Bohemian Rhapsody",
      artistName: "Queen",
      albumArtImagePath: "assets/images/illahi.jpeg",
      audioPath: "assets/audio/illahi.mp3",
    ),
    const Song(
      songName: "Imagine",
      artistName: "John Lennon",
      albumArtImagePath: "assets/images/coldplay.jpeg",
      audioPath: "assets/audio/fixyou.mp3",
    ),
    const Song(
      songName: "Hotel California",
      artistName: "Eagles",
      albumArtImagePath: "assets/images/blocks.png",
      audioPath: "assets/audio/fixyou.mp3",
    ),
    const Song(
      songName: "Shape of My Heart",
      artistName: "Sting",
      albumArtImagePath: "assets/images/sooraj.jpeg",
      audioPath: "assets/audio/sooraj.mp3",
    ),
    const Song(
      songName: "Wonderwall",
      artistName: "Oasis",
      albumArtImagePath: "assets/images/illahi.jpeg",
      audioPath: "assets/audio/illahi.mp3",
    ),
    const Song(
      songName: "Like a Rolling Stone",
      artistName: "Bob Dylan",
      albumArtImagePath: "assets/images/illahi.jpeg",
      audioPath: "assets/audio/illahi.mp3",
    ),
    const Song(
      songName: "Sweet Child o' Mine",
      artistName: "Guns N' Roses",
      albumArtImagePath: "assets/images/sooraj.jpeg",
      audioPath: "assets/audio/sooraj.mp3",
    ),
    const Song(
      songName: "Smells Like Teen Spirit",
      artistName: "Nirvana",
      albumArtImagePath: "assets/images/blocks.png",
      audioPath: "assets/audio/coldplay.mp3",
    ),
    const Song(
      songName: "November Rain",
      artistName: "Guns N' Roses",
      albumArtImagePath: "assets/images/sooraj.jpeg",
      audioPath: "assets/audio/sooraj.mp3",
    ),
    const Song(
      songName: "Don't Stop Believin'",
      artistName: "Journey",
      albumArtImagePath: "assets/images/illahi.jpeg",
      audioPath: "assets/audio/illahi.mp3",
    ),
  ];

  // Currently playing song
  int? _currentSongIndex;

  /*
  
    G E T T E R S

   */

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  /*
  
    S E T T E R S

   */

  set setCurrentSongIndex(int? newIndex){
    _currentSongIndex = newIndex;
    notifyListeners();
  }
}
