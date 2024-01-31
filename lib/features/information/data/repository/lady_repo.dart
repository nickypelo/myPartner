import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lady_model.dart';

class LadyRepo{

  final String uid;
  LadyRepo({required this.uid});

  // reference collection
  final CollectionReference ladyInfoCollection = FirebaseFirestore.instance.collection('ladyInfo');

  // create
  Future createLadyData(LadyModel she ) async{
    return await ladyInfoCollection.add(she.sendInfo());
  }

  // update
  Future updateUserData(String ladyName, String ladyBirthDate, String anniversaryDate ) async{
    return await ladyInfoCollection.doc(uid).set({
      'userID': uid,
      'ladyBirthDate': ladyBirthDate,
      'anniversaryDate': anniversaryDate
    });
  }

  // create lady list from snapshot
  List<LadyModel> _ladyList(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map<LadyModel>((doc) => LadyModel(
        userID: doc.get('userID') ?? '',
        ladyBirthDate: doc.get('ladyBirthDate') ?? '',
        anniversaryDate: doc.get('anniversaryDate') ?? '',
    )).toList();
  }

  // get lady stream
  Stream<List<LadyModel>> get lady{
    return ladyInfoCollection.snapshots().map(_ladyList);
  }

}