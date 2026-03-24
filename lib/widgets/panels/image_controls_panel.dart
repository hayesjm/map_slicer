import 'package:flutter/material.dart';
import '../controls/file_load_row.dart';
import '../controls/info_value_row.dart';
import '../controls/labeled_switch_row.dart';
import '../controls/slider_number_row.dart';
import 'titled_panel.dart';

class ImageControlsPanel extends StatefulWidget {
  const ImageControlsPanel({super.key});

  @override
  State<ImageControlsPanel> createState() => _ImageControlsPanelState();
}

class _ImageControlsPanelState extends State<ImageControlsPanel> {
  String _imageName = 'None';
  String _sourceSize = '—';

  double _zoom = 100;
  double _offsetX = 0;
  double _offsetY = 0;
  double _brightness = 100;
  double _contrast = 100;
  double _saturation = 100;
  double _gamma = 1.00;

  bool _maintainAspectRatio = true;

  void _handleLoadImage() {
    setState(() {
      _imageName = 'example_map.png';
      _sourceSize = '4096 × 2731';
    });
  }

  @override
  Widget build(BuildContext context) {
    return TitledPanel(
      title: 'Image Controls',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          FileLoadRow(
            buttonText: 'Load',
            fileName: _imageName,
            onPressed: _handleLoadImage,
          ),
          SliderNumberRow(
            label: 'Zoom',
            value: _zoom,
            min: 25,
            max: 300,
            defaultValue: 100,
            divisions: 275,
            decimals: 0,
            units: '',
            onChanged: (value) {
              setState(() {
                _zoom = value;
              });
            },
          ),

          SliderNumberRow(
            label: 'Offset X',
            value: _offsetX,
            min: -100,
            max: 100,
            defaultValue: 0,
            divisions: 200,
            decimals: 0,
            units: '',
            onChanged: (value) {
              setState(() {
                _offsetX = value;
              });
            },
          ),

          SliderNumberRow(
            label: 'Offset Y',
            value: _offsetY,
            min: -100,
            max: 100,
            defaultValue: 0,
            divisions: 200,
            decimals: 0,
            units: '',
            onChanged: (value) {
              setState(() {
                _offsetY = value;
              });
            },
          ),

          SliderNumberRow(
            label: 'Bright',
            value: _brightness,
            min: 0,
            max: 200,
            defaultValue: 100,
            divisions: 200,
            decimals: 0,
            units: '',
            onChanged: (value) {
              setState(() {
                _brightness = value;
              });
            },
          ),

          SliderNumberRow(
            label: 'Contrast',
            value: _contrast,
            min: 0,
            max: 200,
            defaultValue: 100,
            divisions: 200,
            decimals: 0,
            units: '',
            onChanged: (value) {
              setState(() {
                _contrast = value;
              });
            },
          ),

          SliderNumberRow(
            label: 'Sat',
            value: _saturation,
            min: 0,
            max: 200,
            defaultValue: 100,
            divisions: 200,
            decimals: 0,
            units: '',
            onChanged: (value) {
              setState(() {
                _saturation = value;
              });
            },
          ),

          SliderNumberRow(
            label: 'Gamma',
            value: _gamma,
            min: 0.25,
            max: 3.00,
            defaultValue: 1.00,
            divisions: 275,
            decimals: 2,
            units: '',
            onChanged: (value) {
              setState(() {
                _gamma = value;
              });
            },
          ),

          LabeledSwitchRow(
            label: 'Maintain AR',
            value: _maintainAspectRatio,
            onChanged: (value) {
              setState(() {
                _maintainAspectRatio = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
