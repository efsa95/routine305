import 'package:flutter/material.dart';

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

  int _currentDay = 0;
  int get currentDay => _currentDay;
  set currentDay(int value) {
    _currentDay = value;
  }

  int _currentMonth = 0;
  int get currentMonth => _currentMonth;
  set currentMonth(int value) {
    _currentMonth = value;
  }

  int _currentWeek = 0;
  int get currentWeek => _currentWeek;
  set currentWeek(int value) {
    _currentWeek = value;
  }
}
