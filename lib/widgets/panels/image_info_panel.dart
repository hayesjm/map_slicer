import 'package:flutter/material.dart';
import '../controls/info_value_row.dart';
import 'titled_panel.dart';

class ImageInfoPanel extends StatelessWidget {
  const ImageInfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitledPanel(
      title: 'Image Info',
      expandBody: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          InfoValueRow(label: 'Source', value: '4096 × 2731'),
          InfoValueRow(label: 'Crop Fit', value: '30.0 × 20.0 in'),
          InfoValueRow(label: 'Zoom', value: '100 %'),
          InfoValueRow(label: 'Offset X', value: '0 %'),
          InfoValueRow(label: 'Offset Y', value: '0 %'),
        ],
      ),
    );
  }
}