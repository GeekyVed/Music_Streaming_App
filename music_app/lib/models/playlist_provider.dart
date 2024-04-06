import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
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

  int? _currentSongIndex;
  late AudioPlayer _audioPlayer;

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  PlaylistProvider() {
    _currentSongIndex = 0;
    _audioPlayer = AudioPlayer();
    listenToDuration();
  }

  bool _isplaying = false;

  Future<void> play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.setAudioSource(
      AudioSource.uri(Uri.parse('asset:///$path')),
    );
    await _audioPlayer.play();
    _isplaying = true;
    notifyListeners();
  }

  void pause() {
    _audioPlayer.pause();
    _isplaying = false;
    notifyListeners();
  }

  void resume() {
    _audioPlayer.play();
    _isplaying = true;
    notifyListeners();
  }

  void pauseOrResume() {
    if (_isplaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        _currentSongIndex = _currentSongIndex! + 1;
      } else {
        _currentSongIndex = 0;
      }
      play();
    }
  }

  void playPreviousSong() {
    if (_currentSongIndex != null) {
      if (_currentDuration.inSeconds > 2) {
        seek(Duration.zero);
      } else {
        if (_currentSongIndex! > 0) {
          _currentSongIndex = _currentSongIndex! - 1;
        } else {
          _currentSongIndex = _playlist.length - 1;
        }
        play();
      }
    }
  }

  void listenToDuration() {
    _audioPlayer.durationStream.listen((newDuration) {
      _totalDuration = newDuration ?? Duration.zero;
      notifyListeners();
    });

    _audioPlayer.positionStream.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.playing) {
        _isplaying = true;
      } else {
        _isplaying = false;
      }
      notifyListeners();
    });

    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        playNextSong();
      }
    });
  }

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isplaying => _isplaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set setCurrentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }
}