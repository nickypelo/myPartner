import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:girlfriend_translator/features/authentication/data/models/user.dart';
import 'package:girlfriend_translator/features/authentication/data/models/user_details.dart';
import 'package:girlfriend_translator/features/authentication/domain/entities/user_entity.dart';
import 'package:girlfriend_translator/features/authentication/domain/repository/user_details_repo.dart';

class UserDetailsRepoImpl extends UserDetailsRepository{
  
  // reference user collection
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('user');

  @override
  Future<void> addUserDetails(UserDetailsEntity userDetails) async{
    // TODO: implement addUserDetails
    await userCollection.add(userDetails.userDetailsMap());

    throw UnimplementedError(
    );
  }

  @override
  Future<UserDetailsModel> getUserDetails() async{
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserDetails(String uuid) async{
    // TODO: implement updateUserDetails
    throw UnimplementedError();
  }

  // create interest list from snapshot
  List<UserDetailsModel> _userList(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map<UserDetailsModel>((doc) => UserDetailsModel(
      userID: doc.get('userID') ?? '',
      firstname: doc.get('firstname') ?? '',
      lastname: doc.get('lastname') ?? '',
      partnerEmail: doc.get('partnerEmail') ?? '',
      role: doc.get('role') ?? '',
    )).toList();
  }

  // get interest stream
  Stream<List<UserDetailsModel>> get userDetails{
    return userCollection.snapshots().map(_userList);
  }

}