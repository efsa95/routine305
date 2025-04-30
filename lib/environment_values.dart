import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _isDevOn = data['isDevOn'];
      _googleMapsAPIKey = data['googleMapsAPIKey'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  bool _isDevOn = false;
  bool get isDevOn => _isDevOn;

  String _googleMapsAPIKey = '';
  String get googleMapsAPIKey => _googleMapsAPIKey;
}
