import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/interest_model.dart';

class InterestRepo{

  final String? uid;
  InterestRepo({required this.uid});

  // reference collection
  final CollectionReference interestCollection = FirebaseFirestore.instance.collection('interest');

  // create
  Future createInterestData( String ladyInterest) async{
    return await interestCollection.add({
      'interestID': uid,
      'ladyInterest': ladyInterest,
    });
  }

  // update
  Future updateInterestData(String interestID, String ladyInterest) async{
    return await interestCollection.doc(uid).set({
      'interestID': interestID,
      'ladyInterest': ladyInterest,
    });
  }

  // create interest list from snapshot
  List<InterestModel> _interestList(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map<InterestModel>((doc) => InterestModel(
        interestID: doc.get('interestID') ?? '',
        ladyInterest: doc.get('ladyInterest') ?? '',
    )).toList();
  }


  // get interest stream
  Stream<List<InterestModel>> get interest{
    return interestCollection.snapshots().map(_interestList);
  }
}