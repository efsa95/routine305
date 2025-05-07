import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _isVisible = false;
  bool get isVisible => _isVisible;
  set isVisible(bool value) {
    _isVisible = value;
  }

  String _setCurrentDay = '';
  String get setCurrentDay => _setCurrentDay;
  set setCurrentDay(String value) {
    _setCurrentDay = value;
  }

  String _setCurrentMonth = '';
  String get setCurrentMonth => _setCurrentMonth;
  set setCurrentMonth(String value) {
    _setCurrentMonth = value;
  }

  DateTime? _currentDate;
  DateTime? get currentDate => _currentDate;
  set currentDate(DateTime? value) {
    _currentDate = value;
  }

  String _currentDay = '';
  String get currentDay => _currentDay;
  set currentDay(String value) {
    _currentDay = value;
  }

  String _currentMonth = '';
  String get currentMonth => _currentMonth;
  set currentMonth(String value) {
    _currentMonth = value;
  }

  String _currentWeek = '';
  String get currentWeek => _currentWeek;
  set currentWeek(String value) {
    _currentWeek = value;
  }

  int _currentstreak = 0;
  int get currentstreak => _currentstreak;
  set currentstreak(int value) {
    _currentstreak = value;
  }

  LatLng? _testLocation = LatLng(41.4862328, -71.53067879999999);
  LatLng? get testLocation => _testLocation;
  set testLocation(LatLng? value) {
    _testLocation = value;
  }

  String _currentDayofMonth = '';
  String get currentDayofMonth => _currentDayofMonth;
  set currentDayofMonth(String value) {
    _currentDayofMonth = value;
  }
}
