import 'package:flutter/cupertino.dart';

class MessageProvider extends ChangeNotifier{
  String _message = '';

  String get message => _message;

  set message(String message){
    _message = message;
    notifyListeners();
  }
}