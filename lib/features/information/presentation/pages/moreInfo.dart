import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/information/data/models/food_model.dart';
import 'package:girlfriend_translator/features/information/data/models/highlight_model.dart';
import 'package:girlfriend_translator/features/information/data/models/interest_model.dart';
import 'package:girlfriend_translator/features/information/data/models/music_model.dart';

import '../widgets/forms/food_update.dart';
import '../widgets/forms/interest_update.dart';
import '../widgets/forms/music_update.dart';
import '../widgets/forms/personality_update.dart';


class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  static Map data = {};
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

    String formChecker = data['name'];

    void showAddPanel(){
      showDialog(context: context, builder: (context){
        return Dialog(
          child: formChecker == 'interests'
              ? const InterestUpdate()
              : formChecker == 'music'
              ? const MusicUpdate()
              : formChecker == 'personality'
              ? const PersonalityUpdate()
              : const FoodUpdate()
        );
      });
    }
    return Scaffold(
      backgroundColor: Colors.purple[100],
      floatingActionButton:
      formChecker != 'about' && formChecker != 'highlight' && formChecker != 'myMusic'
      ? FloatingActionButton(
        child: const Text('Add'),
        onPressed: (){
          showAddPanel();
        },
      )
      : null,
      appBar: AppBar(
        title: Text(data['title'], style: const TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.black),
            borderRadius: BorderRadius.circular(12.0)
          ),
          child: Column(
            children: [
               data['description'] is String
                  ? Text(
                data['description'],
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )
                  : data['description'] is List<FoodModel>
                  ? FoodTable(foodList: data['description'] as List<FoodModel>) // Cast to List<FoodModel>
                  : data['description'] is List<MusicModel>
                  ? MusicTable(musicList: data['description'] as List<MusicModel>)
                  : data['description'] is List<InterestModel>
                  ? ListView.builder(
                      itemCount: data['description'].length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Text(data['description'][index].ladyInterest.toString(), style: const TextStyle(fontSize: 16.0),), // Wrap title in Text
                    )
                  : data['description'] is List<HighlightModel>
                  ? ListView.builder(
                      itemCount: data['description'].length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Text(data['description'][index].ladyHighlight.toString(), style: const TextStyle(fontSize: 16.0),)
                    )
                  : ListView.builder(
                     itemCount: data['description'].length,
                     shrinkWrap: true,
                     itemBuilder: (context, index) => Text(data['description'][index].ladyPersonalityDescription.toString(), style: const TextStyle(fontSize: 16.0),), // Wrap title in Text
                   ),
                ],
          ),
        ),
      ),
    );
  }
}

// for food list
class FoodTable extends StatelessWidget {
  const FoodTable({super.key, required this.foodList});

  final List<FoodModel> foodList;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Expanded(
          child: Text('Place', style: TextStyle(fontWeight: FontWeight.bold),),
        )),
        DataColumn(label: Expanded(
          child: Text('Item 1', style: TextStyle(fontWeight: FontWeight.bold),),
        )),
        DataColumn(label: Expanded(
          child: Text('Item 2', style: TextStyle(fontWeight: FontWeight.bold),),
        ))
      ],
      rows:  foodList.map((item) => DataRow(
              cells: <DataCell>[
              DataCell(Text(item.ladyFoodPlace.toString())),
              DataCell(Text(item.ladyFoodItem1.toString())),
              DataCell(Text(item.ladyFoodItem2.toString()))
              ],),).toList(),
    );
  }
}

// for music list
class MusicTable extends StatelessWidget {
  const MusicTable({super.key, required this.musicList});

  final List<MusicModel> musicList;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Expanded(
          child: Text('Artist', style: TextStyle(fontWeight: FontWeight.bold),),
        )),
        DataColumn(label: Expanded(
          child: Text('Song', style: TextStyle(fontWeight: FontWeight.bold),),
        ))
      ],
      rows:  musicList.map((item) => DataRow(
        cells: <DataCell>[
          DataCell(Text(item.musicArtist.toString())),
          DataCell(Text(item.musicSongName.toString())),
        ],),).toList(),
    );
  }
}
