import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:girlfriend_translator/features/information/data/models/lady_model.dart';

class LadyRepo{

  final String uid;
  LadyRepo({required this.uid});

  // reference collection
  final CollectionReference ladyInfoCollection = FirebaseFirestore.instance.collection('ladyInfo');

  Future updateUserData(String ladyName, String ladyBirthDate, String anniversaryDate ) async{
    return await ladyInfoCollection.doc(uid).set({
      'userID': uid,
      'ladyName': ladyName,
      'ladyBirthDate': ladyBirthDate,
      'anniversaryDate': anniversaryDate
    });
  }

  // create lady list from snapshot
  List<LadyModel> _ladyList(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map<LadyModel>((doc) => LadyModel(
        userID: doc.get('userID') ?? '',
        ladyName: doc.get('ladyName') ?? '',
        ladyBirthDate: doc.get('ladyBirthDate') ?? '',
        anniversaryDate: doc.get('anniversaryDate') ?? '',
    )).toList();
  }

  // get lady stream
  Stream<List<LadyModel>> get lady{
    return ladyInfoCollection.snapshots().map(_ladyList);
  }

}