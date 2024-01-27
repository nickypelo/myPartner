// Functions for buttons and gestures
import 'package:flutter/cupertino.dart';


class ButtonActions{
  static navigateToMoreInfoScreen({
    required String title,
    required List<dynamic> description,
    required String name,
    required BuildContext context,
  }) {
    Navigator.pushNamed(context, '/moreInfo', arguments: {
      'title': title,
      'description': description,
      'name': name,
    });
  }
}