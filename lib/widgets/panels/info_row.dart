import 'package:flutter/material.dart';
import '../../controllers/slicer_controller.dart';
import 'image_info_panel.dart';
import 'map_info_panel.dart';
import 'pdf_info_panel.dart';

class InfoRow extends StatelessWidget {
  final SlicerController controller;

  const InfoRow({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ImageInfoPanel(
            controller: controller,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: MapInfoPanel(
            controller: controller,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: PdfInfoPanel(
            controller: controller,
          ),
        ),
      ],
    );
  }
}