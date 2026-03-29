import '../../controllers/slicer_controller.dart';
import 'package:flutter/material.dart';
import '../controls/mode_button_row.dart';
import '../controls/slider_number_row.dart';
import 'titled_panel.dart';

class GridControlsPanel extends StatelessWidget {
  final SlicerController controller;

  const GridControlsPanel({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return TitledPanel(
          title: 'Grid Controls',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ModeButtonRow<String>(
                label: 'Grid Mode',
                value: controller.project.gridMode,
                options: [
                  ModeOption(
                    value: 'cart',
                    iconWidget: Image.asset(
                      'assets/icons/gm-cart.png',
                      width: 21,
                      height: 21,
                    ),
                  ),
                  ModeOption(
                    value: 'iso',
                    iconWidget: Image.asset(
                      'assets/icons/gm-iso.png',
                      width: 21,
                      height: 21,
                    ),
                  ),
                ],
                onChanged: controller.setGridMode,
              ),

              ModeButtonRow<String>(
                label: 'Line Type',
                value: controller.project.lineType,
                options: [
                  ModeOption(
                    value: 'none',
                    iconWidget: Image.asset(
                      'assets/icons/gl-none.png',
                      width: 21,
                      height: 21,
                    ),
                  ),
                  ModeOption(
                    value: 'line',
                    iconWidget: Image.asset(
                      'assets/icons/gl-solid.png',
                      width: 21,
                      height: 21,
                    ),
                  ),
                  ModeOption(
                    value: 'dash',
                    iconWidget: Image.asset(
                      'assets/icons/gl-dash.png',
                      width: 21,
                      height: 21,
                    ),
                  ),
                  ModeOption(
                    value: 'corner',
                    iconWidget: Image.asset(
                      'assets/icons/gl-corner.png',
                      width: 21,
                      height: 21,
                    ),
                  ),
                ],
                onChanged: controller.setLineType,
              ),

              ModeButtonRow<String>(
                label: 'Grid Color',
                value: controller.project.gridColor,
                options: [
                  ModeOption(
                    value: 'black',
                    iconWidget: Image.asset(
                      'assets/icons/gc-black.png',
                      width: 21,
                      height: 21,
                    ),
                  ),
                  ModeOption(
                    value: 'gray',
                    iconWidget: Image.asset(
                      'assets/icons/gc-gray.png',
                      width: 21,
                      height: 21,
                    ),
                  ),
                  ModeOption(
                    value: 'white',
                    iconWidget: Image.asset(
                      'assets/icons/gc-white.png',
                      width: 21,
                      height: 21,
                    ),
                  ),
                ],
                onChanged: controller.setGridColor,
              ),

              SliderNumberRow(
                label: 'Angle',
                value: controller.project.gridMode == 'iso'
                    ? controller.project.isoAngle
                    : 0,
                min: controller.project.gridMode == 'iso' ? 15 : 0,
                max: controller.project.gridMode == 'iso' ? 45 : 0,
                defaultValue: 0,
                divisions: controller.project.gridMode == 'iso' ? 300 : 1,
                decimals: 1,
                units: '',
                onChanged: controller.project.gridMode == 'iso'
                    ? controller.setIsoAngle
                    : null,
              ),

              SliderNumberRow(
                label: 'Rotation',
                value: controller.project.gridRotation,
                min: -180,
                max: 180,
                defaultValue: 0,
                divisions: 360,
                decimals: 0,
                units: '',
                onChanged: controller.setGridRotation,
              ),

              SliderNumberRow(
                label: 'Offset X',
                value: controller.project.gridOffsetX,
                min: -100,
                max: 100,
                defaultValue: 0,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: controller.setGridOffsetX,
              ),

              SliderNumberRow(
                label: 'Offset Y',
                value: controller.project.gridOffsetY,
                min: -100,
                max: 100,
                defaultValue: 0,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: controller.setGridOffsetY,
              ),

              SliderNumberRow(
                label: 'Size',
                value: controller.project.gridSizeIn,
                min: 0.25,
                max: 3.00,
                defaultValue: 1.00,
                divisions: 275,
                decimals: 2,
                units: '',
                onChanged: controller.setGridSizeIn,
              ),

              SliderNumberRow(
                label: 'Stroke',
                value: controller.project.gridStroke,
                min: 0.1,
                max: 5.0,
                defaultValue: 1.0,
                divisions: 49,
                decimals: 1,
                units: '',
                onChanged: controller.setGridStroke,
              ),


            ],
          ),
        );
      },
    );
  }
}