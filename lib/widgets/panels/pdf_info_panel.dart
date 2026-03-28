import 'package:flutter/material.dart';
import '../../controllers/slicer_controller.dart';
import '../controls/info_value_row.dart';
import 'titled_panel.dart';

class PdfInfoPanel extends StatelessWidget {
  final SlicerController controller;

  const PdfInfoPanel({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final project = controller.project;

        return TitledPanel(
          title: 'PDF Info',
          expandBody: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              InfoValueRow(
                label: 'Slice Size',
                value: project.sliceSize,
              ),
              InfoValueRow(
                label: 'Export DPI',
                value: '${project.exportDpi}',
              ),
              InfoValueRow(
                label: 'Fit Mode',
                value: project.stretchImage ? 'contain' : 'cover',
              ),
              InfoValueRow(
                label: 'Grid Stroke',
                value: project.gridStroke.toStringAsFixed(1),
              ),
              InfoValueRow(
                label: 'Rotation',
                value: '${project.gridRotation.toStringAsFixed(0)}°',
              ),
            ],
          ),
        );
      },
    );
  }
}