import 'package:MyPartner/features/information/data/models/interest_model.dart';
import 'package:MyPartner/features/information/domain/repository/interest_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InterestRepositoryImpl extends InterestRepository{

  // reference collection
  final CollectionReference interestCollection = FirebaseFirestore.instance.collection('interest');

  @override
  Future<void> addInterest(InterestModel interest) async {
    await interestCollection.add(interest.toJson());
  }

  @override
  Future<void> deleteInterest(String docID) async {
    await interestCollection.doc(docID).delete();
  }

  @override
  Stream<QuerySnapshot<Object?>> getInterestStream() {
    return interestCollection.snapshots();
  }

  @override
  Future<void> updateInterest(String uid, InterestModel interest) {
    // TODO: implement updateInterest
    throw UnimplementedError();
  }

}