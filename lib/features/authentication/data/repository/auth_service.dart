import 'package:firebase_auth/firebase_auth.dart';
import 'package:girlfriend_translator/features/authentication/data/models/user.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebase user
  AppUser? _userFromFirebaseUser(User user){
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<AppUser?> get user{
    return _auth.authStateChanges()
        .map((User? user)=> _userFromFirebaseUser(user!)!);
  }

  // sign in with email & Password
  Future signIn(String email, String pwd) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email & password
  Future registration(String email, String pwd) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
      User? user = result.user;

      return _userFromFirebaseUser(user!);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future logoff() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}
