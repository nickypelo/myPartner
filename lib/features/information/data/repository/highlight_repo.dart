import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/highlight_model.dart';

class HighlightRepo{

  final String uid;
  HighlightRepo({required this.uid});

  // reference collection
  final CollectionReference highlightCollection = FirebaseFirestore.instance.collection('highlight');

  Future updateHighlightData(String highlightID, String ladyHighlight) async{
    return await highlightCollection.doc(uid).set({
      'highlightID': highlightID,
      'ladyHighlight': ladyHighlight,
    });
  }

  // create highlight list from snapshot
  List<HighlightModel> _highlightList(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map<HighlightModel>((doc) => HighlightModel(
        highlightID: doc.get('highlightID') ?? '',
        ladyHighlight: doc.get('ladyHighlight') ?? '',
    )).toList();
  }

  // get highlight stream
  Stream<List<HighlightModel>> get highlight{
    return highlightCollection.snapshots().map(_highlightList);
  }
}