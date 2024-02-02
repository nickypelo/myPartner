import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repository/user_details_repo.dart';
import '../models/user_details.dart';


class UserDetailsRepoImpl extends UserDetailsRepository{
  
  // reference user collection
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('user');

  @override
  Future<void> addUser(UserDetailsModel users) async {
    await userCollection.add(users.toJson());
  }

  @override
  Stream<QuerySnapshot<Object?>> getUserStream() {
    return userCollection.snapshots();
  }

}