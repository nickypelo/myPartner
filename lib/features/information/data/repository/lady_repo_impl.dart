import 'package:MyPartner/features/information/data/models/lady_model.dart';
import 'package:MyPartner/features/information/domain/repository/lady_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LadyRepositoryImpl extends LadyRepository{

  // reference collection
  final CollectionReference ladyInfoCollection = FirebaseFirestore.instance.collection('ladyInfo');

  @override
  Future<void> addLady(LadyModel lady) async {
    ladyInfoCollection.add(lady.toJson());
  }

  @override
  Stream<QuerySnapshot<Object?>> getLadyStream() {
    return ladyInfoCollection.snapshots();
  }

}