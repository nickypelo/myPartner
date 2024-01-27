import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/information/data/models/food_model.dart';

class Food extends StatelessWidget {
  const Food({super.key, required this.food});

  final List<FoodModel> food;
  @override
  Widget build(BuildContext context) {
    // access food data
    List<FoodModel> foodDisplay;
    food.length > 3 ? foodDisplay=food.where((item) => food.indexOf(item)<3).toList() : foodDisplay= food.toList();

    return Column(
      children: <Widget>[
        DataTable(
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
        rows:  foodDisplay.map((eish) => DataRow(
          cells: <DataCell>[
            DataCell(Text(eish.ladyFoodPlace.toString(), style: const TextStyle(fontWeight: FontWeight.bold),)),
            DataCell(Text(eish.ladyFoodItem1.toString())),
            DataCell(Text(eish.ladyFoodItem2.toString()))
          ],),).toList(),
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/moreInfo', arguments: {
                    'title': 'Food',
                    'description': food,
                    'name': 'food'
                  });
                },
                child: const Text('show more'))
          ],
        )
      ]
    );
  }
}
