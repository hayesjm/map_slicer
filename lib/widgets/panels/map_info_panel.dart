import 'package:flutter/material.dart';
import 'titled_panel.dart';

class MapInfoPanel extends StatelessWidget {
  const MapInfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitledPanel(
      title: 'Map Info',
      expandBody: true,
      child: _MapInfoPlaceholder(),
    );
  }
}

class _MapInfoPlaceholder extends StatelessWidget {
  const _MapInfoPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Map details will go here',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}