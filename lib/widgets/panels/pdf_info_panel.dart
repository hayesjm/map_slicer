import 'package:flutter/material.dart';
import 'titled_panel.dart';

class PdfInfoPanel extends StatelessWidget {
  const PdfInfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitledPanel(
      title: 'PDF Info',
      expandBody: true,
      child: _PdfInfoPlaceholder(),
    );
  }
}

class _PdfInfoPlaceholder extends StatelessWidget {
  const _PdfInfoPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        'PDF details will go here',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}