import 'package:flutter/foundation.dart';

class SlicerProject extends ChangeNotifier {
  SlicerProject();

  // ====================================
  // Image controls
  // ====================================

  double _zoom = 100.0;
  double _imageOffsetX = 0.0;
  double _imageOffsetY = 0.0;
  double _brightness = 100.0;
  double _contrast = 100.0;
  double _saturation = 100.0;
  double _gamma = 1.0;
  bool _maintainAspectRatio = true;

  // ====================================
  // Grid controls
  // ====================================

  String _gridMode = 'cart';
  String _lineType = 'none';
  String _gridColor = 'black';

  double _isoAngle = 0.0;
  double _gridRotation = 0.0;
  double _gridSizeIn = 1.0;
  double _gridStroke = 1.0;
  double _gridOffsetX = 0.0;
  double _gridOffsetY = 0.0;

  // ====================================
  // Output controls
  // ====================================

  double _printedWidthIn = 30.0;
  double _printedHeightIn = 20.0;
  bool _stretchImage = false;

  String _sliceSize = '8x10';
  int _exportDpi = 150;

  // ====================================
  // Getters
  // ====================================

  double get zoom => _zoom;
  double get imageOffsetX => _imageOffsetX;
  double get imageOffsetY => _imageOffsetY;
  double get brightness => _brightness;
  double get contrast => _contrast;
  double get saturation => _saturation;
  double get gamma => _gamma;
  bool get maintainAspectRatio => _maintainAspectRatio;

  String get gridMode => _gridMode;
  String get lineType => _lineType;
  String get gridColor => _gridColor;

  double get isoAngle => _isoAngle;
  double get gridRotation => _gridRotation;
  double get gridSizeIn => _gridSizeIn;
  double get gridStroke => _gridStroke;
  double get gridOffsetX => _gridOffsetX;
  double get gridOffsetY => _gridOffsetY;

  double get printedWidthIn => _printedWidthIn;
  double get printedHeightIn => _printedHeightIn;
  bool   get stretchImage => _stretchImage;

  String get sliceSize => _sliceSize;
  int get exportDpi => _exportDpi;

  // ====================================
  // Setters
  // ====================================

  set zoom(double value) {
    if (_zoom == value) return;
    _zoom = value;
    notifyListeners();
  }

  set imageOffsetX(double value) {
    if (_imageOffsetX == value) return;
    _imageOffsetX = value;
    notifyListeners();
  }

  set imageOffsetY(double value) {
    if (_imageOffsetY == value) return;
    _imageOffsetY = value;
    notifyListeners();
  }

  set brightness(double value) {
    if (_brightness == value) return;
    _brightness = value;
    notifyListeners();
  }

  set contrast(double value) {
    if (_contrast == value) return;
    _contrast = value;
    notifyListeners();
  }

  set saturation(double value) {
    if (_saturation == value) return;
    _saturation = value;
    notifyListeners();
  }

  set gamma(double value) {
    if (_gamma == value) return;
    _gamma = value;
    notifyListeners();
  }

  set maintainAspectRatio(bool value) {
    if (_maintainAspectRatio == value) return;
    _maintainAspectRatio = value;
    notifyListeners();
  }

  set gridMode(String value) {
    if (_gridMode == value) return;
    _gridMode = value;

    if (_gridMode != 'iso') {
      _isoAngle = 0.0;
    } else if (_isoAngle < 15.0) {
      _isoAngle = 15.0;
    }

    notifyListeners();
  }

  set lineType(String value) {
    if (_lineType == value) return;
    _lineType = value;
    notifyListeners();
  }

  set gridColor(String value) {
    if (_gridColor == value) return;
    _gridColor = value;
    notifyListeners();
  }

  set isoAngle(double value) {
    if (_isoAngle == value) return;
    _isoAngle = value;
    notifyListeners();
  }

  set gridRotation(double value) {
    if (_gridRotation == value) return;
    _gridRotation = value;
    notifyListeners();
  }

  set gridSizeIn(double value) {
    if (_gridSizeIn == value) return;
    _gridSizeIn = value;
    notifyListeners();
  }

  set gridStroke(double value) {
    if (_gridStroke == value) return;
    _gridStroke = value;
    notifyListeners();
  }

  set gridOffsetX(double value) {
    if (_gridOffsetX == value) return;
    _gridOffsetX = value;
    notifyListeners();
  }

  set gridOffsetY(double value) {
    if (_gridOffsetY == value) return;
    _gridOffsetY = value;
    notifyListeners();
  }

  set printedWidthIn(double value) {
    if (_printedWidthIn == value) return;
    _printedWidthIn = value;
    notifyListeners();
  }

  set printedHeightIn(double value) {
    if (_printedHeightIn == value) return;
    _printedHeightIn = value;
    notifyListeners();
  }

  set stretchImage(bool value) {
    if (_stretchImage == value) return;
    _stretchImage = value;
    notifyListeners();
  }
  set sliceSize(String value) {
    if (_sliceSize == value) return;
    _sliceSize = value;
    notifyListeners();
  }

  set exportDpi(int value) {
    if (_exportDpi == value) return;
    _exportDpi = value;
    notifyListeners();
  }

  // ====================================
  // Helpers
  // ====================================

  double get printedAspectRatio =>
      _printedHeightIn == 0 ? 1.0 : _printedWidthIn / _printedHeightIn;

  bool get isIsoMode => _gridMode == 'iso';
}