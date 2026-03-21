import 'package:flutter/material.dart';
import 'image_info_panel.dart';
import 'map_info_panel.dart';
import 'pdf_info_panel.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: ImageInfoPanel()),
        SizedBox(width: 12),
        Expanded(child: MapInfoPanel()),
        SizedBox(width: 12),
        Expanded(child: PdfInfoPanel()),
      ],
    );
  }
}