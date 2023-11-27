import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

double raingsStringtoDouble(String? rating) {
  // return double from string
  if (rating == null) {
    return 0.0;
  } else {
    return double.tryParse(rating) ?? 0.0;
  }
}
