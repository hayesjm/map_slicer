import 'package:flutter/material.dart';
import 'titled_panel.dart';

class OutputControlsPanel extends StatelessWidget {
  const OutputControlsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitledPanel(
      title: 'Output Controls',
      child: _PanelBlock(label: 'Output controls placeholder'),
    );
  }
}

class _PanelBlock extends StatelessWidget {
  final String label;

  const _PanelBlock({required this.label});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}