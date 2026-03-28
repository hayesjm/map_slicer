import 'package:flutter/material.dart';
import '../../controllers/slicer_controller.dart';
import '../controls/info_value_row.dart';
import 'titled_panel.dart';

class MapInfoPanel extends StatelessWidget {
  final SlicerController controller;

  const MapInfoPanel({
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
          title: 'Map Info',
          expandBody: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              InfoValueRow(
                label: 'Print Size',
                value:
                    '${project.printedWidthIn.toStringAsFixed(1)} × ${project.printedHeightIn.toStringAsFixed(1)}"',
              ),
              InfoValueRow(
                label: 'Aspect',
                value: project.printedAspectRatio.toStringAsFixed(3),
              ),
              InfoValueRow(
                label: 'Grid Mode',
                value: project.gridMode,
              ),
              InfoValueRow(
                label: 'Line Type',
                value: project.lineType,
              ),
              InfoValueRow(
                label: 'Grid Color',
                value: project.gridColor,
              ),
              InfoValueRow(
                label: 'Grid Size',
                value: '${project.gridSizeIn.toStringAsFixed(2)}"',
              ),
            ],
          ),
        );
      },
    );
  }
}