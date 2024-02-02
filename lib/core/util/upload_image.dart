import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';



// save picture to storage
Future<String> uploadImage(File imageFile) async{
  Reference reference = FirebaseStorage.instance.ref()
      .child('Profile_Images')
      .child(FirebaseAuth.instance.currentUser!.uid);

  UploadTask uploadTask = reference.putFile(imageFile);
  TaskSnapshot taskSnapshot = await uploadTask;

  String urlOfImage = await taskSnapshot.ref.getDownloadURL();

  return urlOfImage;
}