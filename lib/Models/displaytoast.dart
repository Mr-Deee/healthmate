import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

displayToast(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}