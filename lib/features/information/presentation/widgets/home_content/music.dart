import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/music_model.dart';

class Music extends StatelessWidget {
  const Music({super.key, required this.music});

  final List<MusicModel> music;
  @override
  Widget build(BuildContext context) {

    final musicRecommended = music.where((item) => item.musicWho == 'guy').toList();
    final musicHers = music.where((item) => item.musicWho == 'lady').toList();

    return Accordion(
        children: [
          AccordionSection(
              headerBackgroundColor: Colors.green[700],
              headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
              headerPadding: const EdgeInsets.all(8.0),
              leftIcon: Image.asset('assets/recom.png'),
              header: const Text('Recommended', style: TextStyle(fontSize: 16.0,  color: Colors.white),),
              content: Recommended(songList: musicRecommended,)
          ),
          AccordionSection(
              headerBackgroundColor: Colors.deepPurple,
              headerBackgroundColorOpened: Colors.black.withOpacity(0.55),
              headerPadding: const EdgeInsets.all(8.0),
              leftIcon: Image.asset('assets/fav.png'),
              header: const Text('Your Favorite', style: TextStyle(fontSize: 16.0, color: Colors.white),),
              content: YourFavorite(songList: musicHers,)
          ),
        ]
    );
  }
}

class Recommended extends StatelessWidget {
  const Recommended({super.key, required this.songList});

  final List<MusicModel> songList;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Table(songList: songList,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/moreInfo', arguments: {
                    'title': 'Songs for you',
                    'description': songList,
                    'name': 'myMusic'
                  });
                },
                child: const Text('show more'))
          ],
        )
      ],
    );
  }
}

class YourFavorite extends StatelessWidget {
  const YourFavorite({super.key, required this.songList});

  final List<MusicModel> songList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(songList: songList,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/moreInfo', arguments: {
                    'title': 'Your Favourite Music',
                    'description': songList,
                    'name': 'music'
                  });
                },
                child: const Text('show more'))
          ],
        )
      ],
    );
  }
}

//Structure for the music
class Table extends StatelessWidget {
  final List<MusicModel> songList;

  const Table({super.key, required this.songList});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Expanded(
          child: Text('Artist', style: TextStyle(fontWeight: FontWeight.bold),),
        )),
        DataColumn(label: Expanded(
          child: Text('Song', style: TextStyle(fontWeight: FontWeight.bold),),
        )),
      ],
      rows:  songList.map((item) => DataRow(
        cells: <DataCell>[
          DataCell(Text(item.musicArtist.toString(), style: const TextStyle(fontWeight: FontWeight.bold),)),
          DataCell(Text(item.musicSongName.toString())),
        ],),).toList(),
    );
  }
}


