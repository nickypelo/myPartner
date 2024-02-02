import 'package:MyPartner/features/information/data/models/highlight_model.dart';
import 'package:MyPartner/features/information/domain/repository/highlight_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HighlightRepositoryImpl extends HighlightRepository{

  // reference collection
  final CollectionReference highlightCollection = FirebaseFirestore.instance.collection('highlight');

  @override
  Future<void> addHighlight(HighlightModel highlight) async {
    await highlightCollection.add(highlight.toJson());
  }

  @override
  Future<void> deleteHighlight(String docID) {
    // TODO: implement deleteHighlight
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot<Object?>> getHighlightStream() {
    return highlightCollection.snapshots();
  }

  @override
  Future<void> updateHighlight(String uid, HighlightModel highlight) {
    // TODO: implement updateHighlight
    throw UnimplementedError();
  }
}
