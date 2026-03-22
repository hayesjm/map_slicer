import 'package:flutter/material.dart';
import '../controls/mode_button_row.dart';
import '../controls/slider_number_row.dart';
import 'titled_panel.dart';

class GridControlsPanel extends StatefulWidget {
  const GridControlsPanel({super.key});

  @override
  State<GridControlsPanel> createState() => _GridControlsPanelState();
}

class _GridControlsPanelState extends State<GridControlsPanel> {
  String _gridMode = 'cart';
  String _lineType = 'none';
  String _gridColor = 'black';

  double _isoAngle = 0;
  double _rotation = 0;
  double _gridSize = 1.0;
  double _stroke = 1.0;
  double _offsetX = 0;
  double _offsetY = 0;

  @override
  Widget build(BuildContext context) {
    return TitledPanel(
      title: 'Grid Controls',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ModeButtonRow<String>(
            label: 'Grid Mode',
            value: _gridMode,
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
              setState(() {
                _gridMode = mode;

                if (_gridMode != 'iso') {
                  _isoAngle = 0;
                } else {
                  if (_isoAngle < 15) _isoAngle = 30; // reasonable default
                }
              });
            },
          ),

          ModeButtonRow<String>(
            label: 'Line Type',
            value: _lineType,
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
              setState(() {
                _lineType = mode;
              });
            },
          ),

          ModeButtonRow<String>(
            label: 'Grid Color',
            value: _gridColor,
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
              setState(() {
                _gridColor = mode;
              });
            },
          ),

          SliderNumberRow(
            label: 'Angle',
            value: _gridMode == 'iso' ? _isoAngle : 0,
            min: _gridMode == 'iso' ? 15 : 0,
            max: _gridMode == 'iso' ? 45 : 0,
            defaultValue: 0,
            divisions: _gridMode == 'iso' ? 300 : 1,
            decimals: 1,
            units: '°',
            onChanged: _gridMode == 'iso'
                ? (value) {
                    setState(() {
                      _isoAngle = value;
                    });
                  }
                : null,
          ),
          SliderNumberRow(
            label: 'Rotation',
            value: _rotation,
            min: -180,
            max: 180,
            defaultValue: 0,
            divisions: 360,
            decimals: 0,
            units: '°',
            onChanged: (value) {
              setState(() {
                _rotation = value;
              });
            },
          ),

          SliderNumberRow(
            label: 'Size',
            value: _gridSize,
            min: 0.25,
            max: 3.00,
            defaultValue: 1.00,
            divisions: 275,
            decimals: 2,
            units: '"',
            onChanged: (value) {
              setState(() {
                _gridSize = value;
              });
            },
          ),

          SliderNumberRow(
            label: 'Stroke',
            value: _stroke,
            min: 1.0,
            max: 5.0,
            defaultValue: 1.0,
            divisions: 9,
            decimals: 1,
            units: 'p',
            onChanged: (value) {
              setState(() {
                _stroke = value;
              });
            },
          ),

          SliderNumberRow(
            label: 'Offset X',
            value: _offsetX,
            min: -100.0,
            max: 100.0,
            defaultValue: 0,
            divisions: 200,
            decimals: 1,
            units: '%',
            onChanged: (value) {
              setState(() {
                _offsetX = value;
              });
            },
          ),

          SliderNumberRow(
            label: 'Offset Y',
            value: _offsetY,
            min: -100.0,
            max: 100.0,
            defaultValue: 0,
            divisions: 200,
            decimals: 1,
            units: '%',
            onChanged: (value) {
              setState(() {
                _offsetY = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
