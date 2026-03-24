import 'package:flutter/material.dart';
import '../../services/image_loader.dart';
import '../panels/export_pdf_panel.dart';
import '../panels/grid_controls_panel.dart';
import '../panels/image_controls_panel.dart';
import '../panels/output_controls_panel.dart';

class LeftControlColumn extends StatelessWidget {
  final LoadedImageFile? loadedImage;
  final ValueChanged<LoadedImageFile?> onImageLoaded;

  const LeftControlColumn({
    super.key,
    required this.loadedImage,
    required this.onImageLoaded,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageControlsPanel(
            loadedImage: loadedImage,
            onImageLoaded: onImageLoaded,
          ),
          const SizedBox(height: 12),
          const GridControlsPanel(),
          const SizedBox(height: 12),
          const OutputControlsPanel(),
          const SizedBox(height: 12),
          const ExportPdfPanel(),
        ],
      ),
    );
  }
}