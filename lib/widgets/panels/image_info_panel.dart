import 'package:flutter/material.dart';
import 'titled_panel.dart';

class ImageInfoPanel extends StatelessWidget {
  const ImageInfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitledPanel(
      title: 'Image Info',
      expandBody: true,
      child: _InfoPlaceholder(label: 'Image details will go here'),
    );
  }
}

class _InfoPlaceholder extends StatelessWidget {
  final String label;

  const _InfoPlaceholder({required this.label});

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