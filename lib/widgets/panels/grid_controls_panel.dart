import 'package:flutter/material.dart';
import '../../model/slicer_project.dart';
import '../controls/mode_button_row.dart';
import '../controls/slider_number_row.dart';
import 'titled_panel.dart';

class GridControlsPanel extends StatelessWidget {
  final SlicerProject project;

  const GridControlsPanel({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: project,
      builder: (context, _) {
        return TitledPanel(
          title: 'Grid Controls',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ModeButtonRow<String>(
                label: 'Grid Mode',
                value: project.gridMode,
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
                onChanged: (mode) {
                  project.gridMode = mode;
                },
              ),

              ModeButtonRow<String>(
                label: 'Line Type',
                value: project.lineType,
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
                onChanged: (mode) {
                  project.lineType = mode;
                },
              ),

              ModeButtonRow<String>(
                label: 'Grid Color',
                value: project.gridColor,
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
                onChanged: (mode) {
                  project.gridColor = mode;
                },
              ),

              SliderNumberRow(
                label: 'Angle',
                value: project.gridMode == 'iso' ? project.isoAngle : 0,
                min: project.gridMode == 'iso' ? 15 : 0,
                max: project.gridMode == 'iso' ? 45 : 0,
                defaultValue: 0,
                divisions: project.gridMode == 'iso' ? 300 : 1,
                decimals: 1,
                units: '',
                onChanged: project.gridMode == 'iso'
                    ? (value) {
                        project.isoAngle = value;
                      }
                    : null,
              ),

              SliderNumberRow(
                label: 'Rotation',
                value: project.gridRotation,
                min: -180,
                max: 180,
                defaultValue: 0,
                divisions: 360,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  project.gridRotation = value;
                },
              ),

              SliderNumberRow(
                label: 'Size',
                value: project.gridSizeIn,
                min: 0.25,
                max: 3.00,
                defaultValue: 1.00,
                divisions: 275,
                decimals: 2,
                units: '',
                onChanged: (value) {
                  project.gridSizeIn = value;
                },
              ),

              SliderNumberRow(
                label: 'Stroke',
                value: project.gridStroke,
                min: 0.1,
                max: 5.0,
                defaultValue: 1.0,
                divisions: 49,
                decimals: 1,
                units: '',
                onChanged: (value) {
                  project.gridStroke = value;
                },
              ),

              SliderNumberRow(
                label: 'Offset X',
                value: project.gridOffsetX,
                min: -1.0,
                max: 1.0,
                defaultValue: 0,
                divisions: 200,
                decimals: 2,
                units: '',
                onChanged: (value) {
                  project.gridOffsetX = value;
                },
              ),

              SliderNumberRow(
                label: 'Offset Y',
                value: project.gridOffsetY,
                min: -1.0,
                max: 1.0,
                defaultValue: 0,
                divisions: 200,
                decimals: 2,
                units: '',
                onChanged: (value) {
                  project.gridOffsetY = value;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}