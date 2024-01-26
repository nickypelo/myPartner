import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository{
  // create a user
  Future registration(String email, String pwd);
  // sign in
  Future signIn(String email, String pwd);
  // sign out
  Future logOut();
}