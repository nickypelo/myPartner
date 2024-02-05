import 'package:MyPartner/features/information/data/repository/highlight_repo_impl.dart';
import 'package:MyPartner/features/information/data/repository/interest_repo_impl.dart';
import 'package:flutter/material.dart';

import '../../data/models/food_model.dart';
import '../../data/models/highlight_model.dart';
import '../../data/models/interest_model.dart';
import '../../data/models/music_model.dart';
import '../widgets/forms/food_update.dart';
import '../widgets/forms/highlight_update.dart';
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
              ? MusicUpdate(who: data['character'])
              : formChecker == 'personality'
              ? const PersonalityUpdate()
              : formChecker == 'food'
              ? FoodUpdate(foodList: data['description'])
              : const HighlightUpdate()
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
      : data['character'] == 'guy' && formChecker == 'highlight'
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
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.black),
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: SingleChildScrollView(
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
                      itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text('${index+1}. ${data['description'][index].ladyInterest}', style: const TextStyle(fontSize: 14.0),),
                          trailing: IconButton(onPressed: (){
                            InterestRepositoryImpl().deleteInterest(data['description'][index].documentID.toString());
                          }, icon: const Icon(Icons.delete, size: 16.0,)),
                      ), // Wrap title in Text
                    )
                  : data['description'] is List<HighlightModel>
                  ? ListView.builder(
                      itemCount: data['description'].length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text('${index+1}. ${data['description'][index].ladyHighlight}', style: const TextStyle(fontSize: 14.0),),
                        trailing: IconButton(onPressed: (){
                          HighlightRepositoryImpl().deleteHighlight(data['description'][index].documentID.toString());
                        }, icon: const Icon(Icons.delete, size: 16.0,)),
                      )
                    )
                  : ListView.builder(
                     itemCount: data['description'].length,
                     shrinkWrap: true,
                     itemBuilder: (context, index) => Text('${data['description'][index].ladyPersonalityDescription}', style: const TextStyle(fontSize: 14.0),), // Wrap title in Text
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

    double breadth = MediaQuery.of(context).size.width * .08;

    return DataTable(
      columnSpacing: breadth,
      columns: const <DataColumn>[
        DataColumn(label: Text('Type', style: TextStyle(fontWeight: FontWeight.bold),)),
        DataColumn(label: Text('Item 1', style: TextStyle(fontWeight: FontWeight.bold),)),
        DataColumn(label: Text('Item 2', style: TextStyle(fontWeight: FontWeight.bold),)),
      ],
      rows:  foodList.map((item) => DataRow(
              cells: <DataCell>[
              DataCell(Text(item.ladyFoodType.toString(), style: const TextStyle(fontSize: 12.0),)),
              DataCell(Text(item.ladyFoodItem1.toString(), style: const TextStyle(fontSize: 12.0),)),
              DataCell(Text(item.ladyFoodItem2.toString(), style: const TextStyle(fontSize: 12.0),)),
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
      columnSpacing: MediaQuery.of(context).size.width * .12,
      columns: const <DataColumn>[
        DataColumn(
          label: Text('Artist', style: TextStyle(fontWeight: FontWeight.bold)),

        ),
        DataColumn(label: Text('Song', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),)
        ),
        // DataColumn(
        //     label: Text('', style: TextStyle(fontWeight: FontWeight.bold))
        // )
      ],
      rows:  musicList.map((item) => DataRow(
        cells: <DataCell>[
          DataCell(Text(item.musicArtist.toString(), style: const TextStyle(fontSize: 12.0),)),
          DataCell(Text(item.musicSongName.toString(), style: const TextStyle(fontSize: 12.0),)),
          // DataCell(IconButton(onPressed: ()=> MusicRepositoryImpl().deleteMusic(item.documentID.toString()), icon: const Icon(Icons.delete, size: 18,)),)
        ],),).toList(),
    );
  }
}
