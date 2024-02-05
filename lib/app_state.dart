import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _operatorName = prefs.getString('ff_operatorName') ?? _operatorName;
    });
    _safeInit(() {
      _operatorLine = prefs.getString('ff_operatorLine') ?? _operatorLine;
    });
    _safeInit(() {
      _operatorShift = prefs.getString('ff_operatorShift') ?? _operatorShift;
    });
    _safeInit(() {
      _operatorProduct =
          prefs.getString('ff_operatorProduct') ?? _operatorProduct;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _operatorName = '';
  String get operatorName => _operatorName;
  set operatorName(String value) {
    _operatorName = value;
    prefs.setString('ff_operatorName', value);
  }

  String _operatorLine = '';
  String get operatorLine => _operatorLine;
  set operatorLine(String value) {
    _operatorLine = value;
    prefs.setString('ff_operatorLine', value);
  }

  String _operatorShift = '';
  String get operatorShift => _operatorShift;
  set operatorShift(String value) {
    _operatorShift = value;
    prefs.setString('ff_operatorShift', value);
  }

  String _operatorProduct = '';
  String get operatorProduct => _operatorProduct;
  set operatorProduct(String value) {
    _operatorProduct = value;
    prefs.setString('ff_operatorProduct', value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
