import 'package:flutter/material.dart';

import '../model/slicer_project.dart';

class GridLineSet {
  final List<double> verticals;
  final List<double> horizontals;
  final Color color;
  final double strokeWidthPx;

  const GridLineSet({
    required this.verticals,
    required this.horizontals,
    required this.color,
    required this.strokeWidthPx,
  });
}

GridLineSet? computeCartesianGridLines({
  required SlicerProject project,
  required double stageWidthPx,
  required double stageHeightPx,
}) {
  if (project.gridMode != 'cart') return null;
  if (project.lineType != 'line') return null;
  if (project.printedWidthIn <= 0 || project.printedHeightIn <= 0) return null;
  if (project.gridSizeIn <= 0) return null;

  final pixelsPerInchX = stageWidthPx / project.printedWidthIn;
  final pixelsPerInchY = stageHeightPx / project.printedHeightIn;

  final stepX = project.gridSizeIn * pixelsPerInchX;
  final stepY = project.gridSizeIn * pixelsPerInchY;

  if (stepX <= 0 || stepY <= 0) return null;

  final phaseX = _offsetPercentToPhasePx(
    percent: project.gridOffsetX,
    stepPx: stepX,
  );

  final phaseY = _offsetPercentToPhasePx(
    percent: project.gridOffsetY,
    stepPx: stepY,
  );

  final verticals = _generateLinePositions(
    extentPx: stageWidthPx,
    stepPx: stepX,
    phasePx: phaseX,
  );

  final horizontals = _generateLinePositions(
    extentPx: stageHeightPx,
    stepPx: stepY,
    phasePx: phaseY,
  );

  return GridLineSet(
    verticals: verticals,
    horizontals: horizontals,
    color: resolveGridColor(project.gridColor),
    strokeWidthPx: project.gridStroke,
  );
}

Color resolveGridColor(String gridColor) {
  switch (gridColor) {
    case 'white':
      return Colors.white.withValues(alpha: 0.95);
    case 'gray':
      return const Color.fromRGBO(107, 114, 128, 0.95);
    case 'black':
    default:
      return const Color.fromRGBO(0, 0, 0, 0.95);
  }
}

double _offsetPercentToPhasePx({
  required double percent,
  required double stepPx,
}) {
  if (stepPx <= 0) return 0;

  final clamped = percent.clamp(-100.0, 100.0);
  return (clamped / 100.0) * stepPx;
}

List<double> _generateLinePositions({
  required double extentPx,
  required double stepPx,
  required double phasePx,
}) {
  if (extentPx <= 0 || stepPx <= 0) return const [];

  final positions = <double>[];

  double start = phasePx % stepPx;
  if (start < 0) start += stepPx;

  for (double x = start; x <= extentPx; x += stepPx) {
    positions.add(x);
  }

  for (double x = start - stepPx; x >= 0; x -= stepPx) {
    positions.add(x);
  }

  positions.sort();
  return positions;
}