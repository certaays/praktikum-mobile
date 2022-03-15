import 'package:flutter/material.dart';
import 'top_album.dart';

class ListSong extends StatefulWidget {
  final int index;

  const ListSong({Key? key, required this.index}) : super(key: key);

  @override
  _ListSongState createState() => _ListSongState();
}

class _ListSongState extends State<ListSong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Song List"),
      ),
      body:
      ListView.builder(
        itemBuilder: (context, index) {
          final TopAlbum album = topAlbumList[widget.index];
          return InkWell(
            onTap: () {},
            child: Card(
              child: Column(
                children: [
                  // Image.network(album.imageUrls),
                  Text(album.songs[index]),
                ],
              ),
            ),
          );
        },
        itemCount: topAlbumList[widget.index].songs.length,),
    );
  }
}
