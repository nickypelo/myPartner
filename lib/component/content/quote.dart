import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Quote extends StatefulWidget {
  const Quote({super.key});

  @override
  State<Quote> createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  String verse = '';
  String verseText ='';
  //http for verse
  void getVerse() async{
    Response response = await get(Uri.parse('https://bible-api.com/?random=verse'));
    Map data = jsonDecode(response.body);

    setState(() {
      verse =  data['reference'];
      verseText = data['text'];
    });
  }


  @override
  void initState(){
    super.initState();
    getVerse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('$verse', style: TextStyle(fontWeight: FontWeight.bold),),
          Text('$verseText'),
          // Text('For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.')
        ],
      ),
    );
  }
}
