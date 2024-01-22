import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/music_model.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    // access music data
    final music = Provider.of<List<MusicModel>>(context);

    final musicRecommended = music.where((item) => item.musicWho == 'nicholas').toList();
    final musicHers = music.where((item) => item.musicWho == 'rhulani').toList();
    return Accordion(
        children: [
          AccordionSection(
              headerBackgroundColor: Colors.green[700],
              headerBackgroundColorOpened: Colors.purple[300],
              headerPadding: EdgeInsets.all(8.0),
              leftIcon: Icon(Icons.add),
              header: Text('Recommended', style: TextStyle(fontSize: 16.0,  color: Colors.white),),
              content: Recommended(songList: musicRecommended,)
          ),
          AccordionSection(
              headerBackgroundColor: Colors.purple,
              headerBackgroundColorOpened: Colors.green[400],
              headerPadding: EdgeInsets.all(8.0),
              leftIcon: Icon(Icons.add),
              header: Text('Your Favorite', style: TextStyle(fontSize: 16.0, color: Colors.white),),
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
                child: Text('show more'))
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
                child: Text('show more'))
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
    return Container(
        child: DataTable(
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
              DataCell(Text(item.musicArtist.toString(), style: TextStyle(fontWeight: FontWeight.bold),)),
              DataCell(Text(item.musicSongName.toString())),
            ],),).toList(),
        )
    );
  }
}


