import 'package:flutter/material.dart';
import '../controls/mode_button_row.dart';
import 'titled_panel.dart';
import '../icons/grid_mode_icons.dart';

class GridControlsPanel extends StatefulWidget {
  const GridControlsPanel({super.key});

  @override
  State<GridControlsPanel> createState() => _GridControlsPanelState();
}

class _GridControlsPanelState extends State<GridControlsPanel> {
  String _gridMode = 'none';

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
            options: const [
              ModeOption(value: 'none', iconWidget: GridModeNoneIcon()),
              ModeOption(value: 'square', iconWidget: GridModeSquareIcon()),
              ModeOption(value: 'iso', iconWidget: GridModeIsoIcon()),
            ],
            onChanged: (mode) {
              setState(() {
                _gridMode = mode;
              });
            },
          ),
        ],
      ),
    );
  }
}
