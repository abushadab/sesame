// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:fluttertoast/fluttertoast.dart';

Future customToast(
  BuildContext context,
  String message,
  Color? bgColor,
) async {
  // Convert the Color object to a hexadecimal string
  String bgColorHex = bgColor != null
      ? "#" + bgColor.value.toRadixString(16).substring(2).toUpperCase()
      : "#00B09B";

  // show a toast
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Color(0xFF757575),
      textColor: Colors.white,
      webBgColor: bgColorHex,
      webPosition: 'center',
      fontSize: 16.0);
}
