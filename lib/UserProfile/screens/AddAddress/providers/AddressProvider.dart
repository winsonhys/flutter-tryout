import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  String _postal;
  String get postal => _postal;
  set postal(String postal) {
    _postal = postal;
    notifyListeners();
  }

  String _line1;
  String get line1 => _line1;
  set line1(String line1) {
    _line1 = line1;
    notifyListeners();
  }

  String _line2;
  String get line2 => _line2;
  set line2(String line2) {
    _line2 = line2;
    notifyListeners();
  }

  bool _isDefault = false;
  bool get isDefault => _isDefault;
  set isDefault(bool isDefault) {
    _isDefault = isDefault;
    notifyListeners();
  }

  final String _country = 'SG';
  String get country => _country;

  final String _city = 'Singapore';
  String get city => _city;

  final String _state = 'Singapore';
  String get state => _state;
}
