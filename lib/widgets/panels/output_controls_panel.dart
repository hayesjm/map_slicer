import 'package:flutter/material.dart';
import '../../controllers/slicer_controller.dart';
import '../controls/labeled_switch_row.dart';
import '../controls/mode_button_row.dart';
import '../controls/slider_number_row.dart';
import '../controls/info_value_row.dart';
import 'titled_panel.dart';

class OutputControlsPanel extends StatelessWidget {
  final SlicerController controller;

  const OutputControlsPanel({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return TitledPanel(
          title: 'Output Controls',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SliderNumberRow(
                label: 'Width',
                value: controller.project.printedWidthIn,
                min: 8,
                max: 36,
                defaultValue: 30,
                divisions: 56,
                decimals: 1,
                units: '"',
                onChanged: controller.setPrintedWidth,
              ),

              SliderNumberRow(
                label: 'Height',
                value: controller.project.printedHeightIn,
                min: 8,
                max: 36,
                defaultValue: 20,
                divisions: 56,
                decimals: 1,
                units: '"',
                onChanged: controller.setPrintedHeight,
              ),

              LabeledSwitchRow(
                label: 'Maintain AR',
                value: controller.project.maintainAspectRatio,
                onChanged: controller.setMaintainAspectRatio,
              ),

              LabeledSwitchRow(
                label: 'Stretch Image',
                value: controller.project.stretchImage,
                onChanged: controller.setStretchImage,
              ),

              ModeButtonRow<String>(
                label: 'Slice Size',
                value: controller.project.sliceSize,
                options: const [
                  ModeOption(value: '8x10', label: '8×10'),
                  ModeOption(value: '8x10.5', label: '8×10.5'),
                ],
                onChanged: controller.setSliceSize,
              ),

              InfoValueRow(
                label: 'Export DPI',
                value: '${controller.project.exportDpi}',
              ),
            ],
          ),
        );
      },
    );
  }
}