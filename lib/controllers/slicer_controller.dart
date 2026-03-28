import 'package:flutter/foundation.dart';
import '../model/slicer_project.dart';
import '../services/image_loader.dart';

class SlicerController extends ChangeNotifier {
  final SlicerProject project;

  LoadedImageFile? _loadedImage;

  SlicerController({
    required this.project,
  }) {
    project.addListener(_handleProjectChanged);
  }

  LoadedImageFile? get loadedImage => _loadedImage;

  String get imageName => _loadedImage?.fileName ?? 'No file selected';

  String get sourceSize => _loadedImage == null
      ? '—'
      : '${_loadedImage!.pixelWidth} × ${_loadedImage!.pixelHeight}';

  double? get loadedImageAspectRatio {
    if (_loadedImage == null || _loadedImage!.pixelHeight == 0) return null;
    return _loadedImage!.pixelWidth / _loadedImage!.pixelHeight;
  }

  Future<void> loadImage() async {
    final loaded = await ImageLoaderService.pickImage();
    if (loaded == null) return;

    _loadedImage = loaded;

    if (project.maintainAspectRatio) {
      _reconcilePrintedSizeFromWidth();
    }

    notifyListeners();
  }

  void clearImage() {
    _loadedImage = null;
    notifyListeners();
  }

  void setMaintainAspectRatio(bool value) {
    project.maintainAspectRatio = value;

    if (value) {
      _reconcilePrintedSizeFromWidth();
    }
  }

  void setPrintedWidth(double value) {
    project.printedWidthIn = value;

    if (project.maintainAspectRatio) {
      final aspect = loadedImageAspectRatio;
      if (aspect != null && aspect > 0) {
        project.printedHeightIn = value / aspect;
      }
    }
  }

  void setPrintedHeight(double value) {
    project.printedHeightIn = value;

    if (project.maintainAspectRatio) {
      final aspect = loadedImageAspectRatio;
      if (aspect != null && aspect > 0) {
        project.printedWidthIn = value * aspect;
      }
    }
  }

  void setStretchImage(bool value) {
    project.stretchImage = value;
  }

  void setZoom(double value) => project.zoom = value;
  void setImageOffsetX(double value) => project.imageOffsetX = value;
  void setImageOffsetY(double value) => project.imageOffsetY = value;
  void setBrightness(double value) => project.brightness = value;
  void setContrast(double value) => project.contrast = value;
  void setSaturation(double value) => project.saturation = value;
  void setGamma(double value) => project.gamma = value;

  void setGridMode(String value) => project.gridMode = value;
  void setLineType(String value) => project.lineType = value;
  void setGridColor(String value) => project.gridColor = value;
  void setIsoAngle(double value) => project.isoAngle = value;
  void setGridRotation(double value) => project.gridRotation = value;
  void setGridSizeIn(double value) => project.gridSizeIn = value;
  void setGridStroke(double value) => project.gridStroke = value;
  void setGridOffsetX(double value) => project.gridOffsetX = value;
  void setGridOffsetY(double value) => project.gridOffsetY = value;

  void setSliceSize(String value) => project.sliceSize = value;
  void setExportDpi(int value) => project.exportDpi = value;

  void _reconcilePrintedSizeFromWidth() {
    final aspect = loadedImageAspectRatio;
    if (aspect == null || aspect <= 0) return;

    project.printedHeightIn = project.printedWidthIn / aspect;
  }

  void _handleProjectChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    project.removeListener(_handleProjectChanged);
    super.dispose();
  }
}