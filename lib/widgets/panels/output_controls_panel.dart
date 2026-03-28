import 'package:flutter/material.dart';
import '../../model/slicer_project.dart';
import '../controls/info_value_row.dart';
import '../controls/slider_number_row.dart';
import 'titled_panel.dart';

class OutputControlsPanel extends StatelessWidget {
  final SlicerProject project;

  const OutputControlsPanel({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: project,
      builder: (context, _) {
        return TitledPanel(
          title: 'Output Controls',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SliderNumberRow(
                label: 'Width',
                value: project.printedWidthIn,
                min: 8,
                max: 36,
                defaultValue: 30,
                divisions: 56,
                decimals: 1,
                units: '"',
                onChanged: (value) {
                  project.printedWidthIn = value;
                },
              ),

              SliderNumberRow(
                label: 'Height',
                value: project.printedHeightIn,
                min: 8,
                max: 36,
                defaultValue: 20,
                divisions: 56,
                decimals: 1,
                units: '"',
                onChanged: (value) {
                  project.printedHeightIn = value;
                },
              ),

              InfoValueRow(
                label: 'Slice Size',
                value: project.sliceSize,
              ),

              InfoValueRow(
                label: 'Export DPI',
                value: '${project.exportDpi}',
              ),
            ],
          ),
        );
      },
    );
  }
}