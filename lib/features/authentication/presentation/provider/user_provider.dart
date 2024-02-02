import 'package:MyPartner/features/authentication/data/models/user_details.dart';
import 'package:MyPartner/features/authentication/data/repository/user_details_epo_impl.dart';
import 'package:flutter/cupertino.dart';

Stream<List<UserDetailsModel>> userCollectionProvider(BuildContext context) {
  return UserDetailsRepoImpl()
      .getUserStream()
      .map((snapshot) =>
      snapshot.docs.map((doc) => UserDetailsModel.fromDocument(doc)).toList());
}
