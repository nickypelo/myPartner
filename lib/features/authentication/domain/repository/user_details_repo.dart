import 'package:girlfriend_translator/features/authentication/domain/entities/user_entity.dart';

abstract class UserDetailsRepository{

  Future<UserDetailsEntity> getUserDetails();
  Future addUserDetails(UserDetailsEntity userDetails);
  Future<void> updateUserDetails(String uuid);
}