import 'package:flutter/material.dart';
import 'titled_panel.dart';

class ExportPdfPanel extends StatelessWidget {
  const ExportPdfPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitledPanel(
      title: 'Export PDF',
      child: _ExportPlaceholder(),
    );
  }
}

class _ExportPlaceholder extends StatelessWidget {
  const _ExportPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Export action placeholder',
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}