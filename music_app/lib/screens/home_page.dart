import 'package:flutter/material.dart';
import 'package:music_app/models/playlist_provider.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/screens/song_page.dart';
import 'package:music_app/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playlistProvider;
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("P L A Y L I S T"),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary, // Change to a darker color
                borderRadius: BorderRadius.circular(10.0), // Make it square
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove border
                    labelText: 'Search by name',
                    labelStyle: TextStyle(color: Colors.blueGrey), // Change label color
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          _searchText = '';
                        });
                      },
                      icon: Icon(Icons.clear, color: Colors.white), // Change icon color
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Change text color
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<PlaylistProvider>(
              builder: (context, value, child) {
                final List<Song> playlist = value.playlist.where((song) {
                  return song.songName.toLowerCase().contains(_searchText.toLowerCase());
                }).toList();

                return ListView.builder(
                  itemCount: playlist.length,
                  itemBuilder: (context, index) {
                    final Song song = playlist[index];
                    return ListTile(
                      title: Text(song.songName),
                      subtitle: Text(song.artistName),
                      leading: Image.asset(song.albumArtImagePath),
                      onTap: () => goToSong(index),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void goToSong(int songIndex) {
    playlistProvider.setCurrentSongIndex = songIndex;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongPage(),
      ),
    );
  }
}
