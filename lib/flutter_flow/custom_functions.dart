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

int? getCurrentDate() {
  DateTime now = DateTime.now();
  DateTime startOfDay = DateTime(now.year, now.month, now.day);
  int unixTimestamp = startOfDay.millisecondsSinceEpoch ~/ 1000;
  return unixTimestamp;
}

String? calculatePace(
  int? timeInSeconds,
  double? distanceInMiles,
) {
// here we want to calculate the pace per mile, using the time of the run in second, and the distance in miles that has been run. We want to return the pace per mile in a string, so if the person is running at an 8 minute pace per mile the string should be "8:00 /mile"
  if (timeInSeconds == null ||
      distanceInMiles == null ||
      distanceInMiles <= 0) {
    return null; // Return null if inputs are invalid
  }

  double paceInSeconds =
      timeInSeconds / distanceInMiles; // Calculate pace in seconds per mile
  int minutes = (paceInSeconds ~/ 60); // Get whole minutes
  int seconds = (paceInSeconds % 60).round(); // Get remaining seconds

  return '${minutes}:${seconds.toString().padLeft(2, '0')} /mile'; // Format and return pace
}

LatLng? getPreviousPoint(List<LatLng>? points) {
  // I want this to return the second to last point in a list of latlng values
  if (points == null || points.length < 2) {
    return null; // Return null if the list is null or has less than 2 points
  }
  return points[points.length - 2]; // Return the second to last point
}

double? calculateDistance(
  LatLng? point1,
  LatLng? point2,
  double? previousDistance,
) {
  // calculateDistanceshould calculate the distance in meters between the two points using the Haversine formula, convert that distance to miles, add it to the previousDistance, then return the new total as a string rounded to 2 decimal places, followed by the word " miles".
  if (point1 == null || point2 == null) return null;

  const double earthRadius = 6371000; // in meters
  double lat1 = point1.latitude * math.pi / 180;
  double lat2 = point2.latitude * math.pi / 180;
  double deltaLat = (point2.latitude - point1.latitude) * math.pi / 180;
  double deltaLon = (point2.longitude - point1.longitude) * math.pi / 180;

  double a = math.sin(deltaLat / 2) * math.sin(deltaLat / 2) +
      math.cos(lat1) *
          math.cos(lat2) *
          math.sin(deltaLon / 2) *
          math.sin(deltaLon / 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  double distanceInMeters = earthRadius * c;
  double totalDistance = (previousDistance ?? 0) +
      (distanceInMeters * 0.000621371); // convert to miles

  return double.parse(
      (totalDistance).toStringAsFixed(2)); // return rounded to 2 decimal places
}

String? calculateDate(DateTime? dateOfRun) {
  // display a string in the form of "month/day/year" format by parsing the input parameter of dateOfRun which is in DateTime data type, Dont use the DateFormat function or whatever
  if (dateOfRun == null) return null;
  return '${dateOfRun.month}/${dateOfRun.day}/${dateOfRun.year}';
}

String? usersRuns(String? name) {
  // take in the users name, then return a string that says "name's runs" so if the string is "mike" it will return "mike's runs" but if the name ends in an s like if the was james then it would add just an apostraphe before runs not an 's
  if (name == null || name.isEmpty) {
    return null;
  }
  return name.endsWith('s') ? "$name' runs" : "$name's runs";
}

String? calculateTime(int? timeSeconds) {
  // Take in the integer called timeSeconds and return the time in the format of "hours:minutes:seconds" if the time is equal to or greater than an hour, if less than that but greater than or equal to a minute return in the format of "mintes:second" and if less than a minute return in the format of "seconds"
  if (timeSeconds == null) return null;

  if (timeSeconds >= 3600) {
    int hours = timeSeconds ~/ 3600;
    int minutes = (timeSeconds % 3600) ~/ 60;
    int seconds = timeSeconds % 60;
    return '${hours}:${minutes}:${seconds}';
  } else if (timeSeconds >= 60) {
    int minutes = timeSeconds ~/ 60;
    int seconds = timeSeconds % 60;
    return '${minutes}:${seconds}';
  } else {
    return '$timeSeconds';
  }
}

int? getYesterdayDate() {
  DateTime now = DateTime.now();
  DateTime startOfDay = DateTime(now.year, now.month, now.day);
  DateTime yesterday = startOfDay.subtract(Duration(days: 1));
  int unixTimestamp = yesterday.millisecondsSinceEpoch ~/ 1000;
  return unixTimestamp;
}
