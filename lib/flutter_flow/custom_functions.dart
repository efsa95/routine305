import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getCurrentMonth() {
  // create a function that returns the current month only
  return DateFormat('MMMM').format(DateTime.now());
}

String? getCurrentDay() {
  // create a function that returns the current day
  return DateFormat('EEEE').format(DateTime.now());
}

String? getCurrentWeek() {
  // write a function that somehow figures out what the current week is and set it to a number like 1 for first week 2 for second week 3 for 3rd week and returns that number
  DateTime now = DateTime.now();
  int weekNumber = ((now.day - 1) / 7).floor() + 1; // Calculate the week number
  return weekNumber.toString(); // Return the week number as a string
}
