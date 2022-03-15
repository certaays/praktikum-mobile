import 'package:flutter/material.dart';
import 'list_song.dart';
import 'top_album.dart';

class ListAlbum extends StatelessWidget {
  const ListAlbum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Album"),
      ),
      body: 
        GridView.builder(
          itemBuilder: (context, int index){
            final TopAlbum album = topAlbumList[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListSong(index: index);
                }));
              },
              child:
              Image.network(album.imageUrls),
              // Text("${index}"),
            );
          },
            itemCount: topAlbumList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0
            ),
        )
    );
  }
}
