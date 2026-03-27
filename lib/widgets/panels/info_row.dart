import 'package:flutter/material.dart';
import 'package:map_slicer/services/image_loader.dart';
import 'image_info_panel.dart';
import 'map_info_panel.dart';
import 'pdf_info_panel.dart';
import '../../model/slicer_project.dart';

class InfoRow extends StatelessWidget {
  final SlicerProject project;
  final LoadedImageFile? loadedImage;
  const InfoRow({super.key, required this.project, required this.loadedImage});

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