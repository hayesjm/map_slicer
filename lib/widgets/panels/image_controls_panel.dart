import 'package:flutter/material.dart';
import 'titled_panel.dart';

class ImageControlsPanel extends StatelessWidget {
  const ImageControlsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitledPanel(
      title: 'Image Controls',
      child: _PanelBlock(label: 'Image controls placeholder'),
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