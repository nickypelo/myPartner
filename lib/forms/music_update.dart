import 'package:flutter/material.dart';
import 'package:girlfriend_translator/service/repository/music_repo.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class MusicUpdate extends StatefulWidget {
  const MusicUpdate({super.key});

  @override
  State<MusicUpdate> createState() => _MusicUpdateState();
}

class _MusicUpdateState extends State<MusicUpdate> {
  final _formKey = GlobalKey<FormState>();

  // text field state
  String _musicArtist = '';
  String _musicSongName = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    // access user
    final user = Provider.of<AppUser>(context);

    return Container(
      color: Colors.purple[50],
      padding: EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height *.6,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            Text('Favourite Song?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple
                    ),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        await MusicRepo(uid: user.uid).createInterestData('rhulani', _musicArtist, _musicSongName);
                        print('Music added');
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add', style: TextStyle(color: Colors.white,))),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Artist:',
              ),
              validator: (value){
                return value!.isEmpty ? 'Artist cannot be empty!': null;
              },
              onChanged: (value){
                _musicArtist = value;
              },
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Song name:',
              ),
              validator: (value){
                return value!.isEmpty ? 'Song name cannot be empty!' : null;
              },
              onChanged: (value){
                _musicSongName = value;
              },
            ),

          ],
        ),
      ),
    );
  }
}
