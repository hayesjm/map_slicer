import 'package:flutter/material.dart';
import '../../controllers/slicer_controller.dart';
import '../controls/file_load_row.dart';
import '../controls/info_value_row.dart';
import '../controls/labeled_switch_row.dart';
import '../controls/slider_number_row.dart';
import 'titled_panel.dart';

class ImageControlsPanel extends StatelessWidget {
  final SlicerController controller;

  const ImageControlsPanel({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return TitledPanel(
          title: 'Image Controls',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              FileLoadRow(
                buttonText: 'Load',
                fileName: controller.imageName,
                onPressed: controller.loadImage,
              ),

              InfoValueRow(
                label: 'Source',
                value: controller.sourceSize,
              ),

              SliderNumberRow(
                label: 'Zoom',
                value: controller.project.zoom,
                min: 25,
                max: 300,
                defaultValue: 100,
                divisions: 275,
                decimals: 0,
                units: '%',
                onChanged: controller.setZoom,
              ),

              SliderNumberRow(
                label: 'Offset X',
                value: controller.project.imageOffsetX,
                min: -100,
                max: 100,
                defaultValue: 0,
                divisions: 200,
                decimals: 0,
                units: '%',
                onChanged: controller.setImageOffsetX,
              ),

              SliderNumberRow(
                label: 'Offset Y',
                value: controller.project.imageOffsetY,
                min: -100,
                max: 100,
                defaultValue: 0,
                divisions: 200,
                decimals: 0,
                units: '%',
                onChanged: controller.setImageOffsetY,
              ),

              SliderNumberRow(
                label: 'Bright',
                value: controller.project.brightness,
                min: 0,
                max: 200,
                defaultValue: 100,
                divisions: 200,
                decimals: 0,
                units: '%',
                onChanged: controller.setBrightness,
              ),

              SliderNumberRow(
                label: 'Contrast',
                value: controller.project.contrast,
                min: 0,
                max: 200,
                defaultValue: 100,
                divisions: 200,
                decimals: 0,
                units: '%',
                onChanged: controller.setContrast,
              ),

              SliderNumberRow(
                label: 'Sat',
                value: controller.project.saturation,
                min: 0,
                max: 200,
                defaultValue: 100,
                divisions: 200,
                decimals: 0,
                units: '%',
                onChanged: controller.setSaturation,
              ),

              SliderNumberRow(
                label: 'Gamma',
                value: controller.project.gamma,
                min: 0.25,
                max: 3.00,
                defaultValue: 1.00,
                divisions: 275,
                decimals: 2,
                units: '',
                onChanged: controller.setGamma,
              ),
            ],
          ),
        );
      },
    );
  }
}