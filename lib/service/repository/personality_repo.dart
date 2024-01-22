import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:girlfriend_translator/model/personality_model.dart';

class PersonalityRepo{

  final String uid;
  PersonalityRepo({required this.uid});

  // reference collection
  final CollectionReference personalityCollection = FirebaseFirestore.instance.collection('personality');

  Future updatePersonalityData(String personalityID, String ladyPersonalityDescription) async{
    return await personalityCollection.doc(uid).set({
      'personalityID': personalityID,
      'ladyPersonalityDescription': ladyPersonalityDescription,
    });
  }

  // create personality list from snapshot
  List<PersonalityModel> _personalityList(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map<PersonalityModel>((doc) => PersonalityModel(
        personalityID: doc.get('personalityID') ?? '',
        ladyPersonalityDescription: doc.get('ladyPersonalityDescription') ?? '',
    )).toList();
  }


  // get personality stream
  Stream<List<PersonalityModel>> get personality{
    return personalityCollection.snapshots().map(_personalityList);
  }
}