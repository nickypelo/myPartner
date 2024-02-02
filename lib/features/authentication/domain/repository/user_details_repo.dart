
import 'package:MyPartner/features/authentication/data/models/user_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserDetailsRepository{

  // CREATE: add new user
  Future<void> addUser(UserDetailsModel users);

  // READ: get user from database
  Stream<QuerySnapshot> getUserStream();

  // // UPDATE: update user details
  // Future<void> updateUsers(String uid, UserDetailsModel users);
  //
  // // DELETE: remove a food item
  // Future<void> deleteUsers(String docID);
}