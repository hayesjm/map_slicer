import 'dart:math' as math;
import 'dart:ui';

import '../model/slicer_project.dart';

class SlicerComposition {
  final Size viewportSize;
  final Size stageSize;
  final Rect stageRect;

  final Size baseImageSize;
  final Size imageSize;
  final Rect imageRect;

  final double overflowX;
  final double overflowY;

  const SlicerComposition({
    required this.viewportSize,
    required this.stageSize,
    required this.stageRect,
    required this.baseImageSize,
    required this.imageSize,
    required this.imageRect,
    required this.overflowX,
    required this.overflowY,
  });
}

SlicerComposition computeSlicerComposition({
  required SlicerProject project,
  required double viewportWidth,
  required double viewportHeight,
  required double sourceImageWidth,
  required double sourceImageHeight,
}) {
  final viewportSize = Size(viewportWidth, viewportHeight);

  final stageSize = fitStageSize(
    availableWidth: viewportWidth,
    availableHeight: viewportHeight,
    targetAspectRatio: project.printedAspectRatio,
  );

  final stageLeft = (viewportWidth - stageSize.width) / 2;
  final stageTop = (viewportHeight - stageSize.height) / 2;

  final stageRect = Rect.fromLTWH(
    stageLeft,
    stageTop,
    stageSize.width,
    stageSize.height,
  );

  final baseImageSize = computeBaseImageSize(
    stageWidth: stageSize.width,
    stageHeight: stageSize.height,
    imageWidth: sourceImageWidth,
    imageHeight: sourceImageHeight,
    stretchImage: project.stretchImage,
  );

  final zoomScale = project.zoom / 100.0;

  final imageSize = Size(
    baseImageSize.width * zoomScale,
    baseImageSize.height * zoomScale,
  );

  final overflowX = math.max(0.0, imageSize.width - stageSize.width);
  final overflowY = math.max(0.0, imageSize.height - stageSize.height);

  final imageLeft = stageRect.left + mapOffsetPercentToTranslation(
    percent: project.imageOffsetX,
    overflow: overflowX,
  );

  final imageTop = stageRect.top + mapOffsetPercentToTranslation(
    percent: project.imageOffsetY,
    overflow: overflowY,
  );

  final imageRect = Rect.fromLTWH(
    imageLeft,
    imageTop,
    imageSize.width,
    imageSize.height,
  );

  return SlicerComposition(
    viewportSize: viewportSize,
    stageSize: stageSize,
    stageRect: stageRect,
    baseImageSize: baseImageSize,
    imageSize: imageSize,
    imageRect: imageRect,
    overflowX: overflowX,
    overflowY: overflowY,
  );
}

Size fitStageSize({
  required double availableWidth,
  required double availableHeight,
  required double targetAspectRatio,
}) {
  if (targetAspectRatio <= 0) {
    return Size(availableWidth, availableHeight);
  }

  final availableAspectRatio = availableWidth / availableHeight;

  if (availableAspectRatio > targetAspectRatio) {
    final height = availableHeight;
    final width = height * targetAspectRatio;
    return Size(width, height);
  } else {
    final width = availableWidth;
    final height = width / targetAspectRatio;
    return Size(width, height);
  }
}

Size computeBaseImageSize({
  required double stageWidth,
  required double stageHeight,
  required double imageWidth,
  required double imageHeight,
  required bool stretchImage,
}) {
  if (stretchImage) {
    return Size(stageWidth, stageHeight);
  }

  final imageAspect = imageWidth / imageHeight;
  final stageAspect = stageWidth / stageHeight;

  if (imageAspect > stageAspect) {
    final height = stageHeight;
    final width = height * imageAspect;
    return Size(width, height);
  } else {
    final width = stageWidth;
    final height = width / imageAspect;
    return Size(width, height);
  }
}

double mapOffsetPercentToTranslation({
  required double percent,
  required double overflow,
}) {
  if (overflow <= 0) return 0;

  final clampedPercent = percent.clamp(-100.0, 100.0);
  final t = (clampedPercent + 100.0) / 200.0;

  return -overflow * t;
}