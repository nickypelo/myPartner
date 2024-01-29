import 'package:flutter/material.dart';
import 'package:girlfriend_translator/features/information/data/repository/music_repo.dart';
import 'package:provider/provider.dart';

import '../../../../authentication/data/models/user.dart';


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
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height *.6,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0,),
            const Text('Favourite Song?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
            const SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple
                    ),
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        await MusicRepo(uid: user.uid).createInterestData('lady', _musicArtist, _musicSongName);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Add', style: TextStyle(color: Colors.white,))),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Artist:',
              ),
              validator: (value){
                return value!.isEmpty ? 'Artist cannot be empty!': null;
              },
              onChanged: (value){
                _musicArtist = value;
              },
            ),
            const SizedBox(height: 20.0,),
            TextFormField(
              decoration: const InputDecoration(
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
