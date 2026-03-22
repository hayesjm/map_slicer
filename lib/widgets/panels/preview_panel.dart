import 'package:flutter/material.dart';
import 'titled_panel.dart';

class PreviewPanel extends StatelessWidget {
  const PreviewPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitledPanel(
      title: 'Preview',
      useBodyPadding: false,
      expandBody: true,
      child: _PreviewPlaceholder(),
    );
  }
}

class _PreviewPlaceholder extends StatelessWidget {
  const _PreviewPlaceholder();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: const Center(
        child: Text(
          'Preview Area\n(No image loaded)',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}