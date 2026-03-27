import 'package:flutter/material.dart';
import '../../model/slicer_project.dart';
import '../../services/image_loader.dart';
import '../panels/export_pdf_panel.dart';
import '../panels/grid_controls_panel.dart';
import '../panels/image_controls_panel.dart';
import '../panels/output_controls_panel.dart';

class LeftControlColumn extends StatelessWidget {
  final SlicerProject project;
  final LoadedImageFile? loadedImage;
  final ValueChanged<LoadedImageFile?> onImageLoaded;

  const LeftControlColumn({
    super.key,
    required this.project,
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
            project: project,
            loadedImage: loadedImage,
            onImageLoaded: onImageLoaded,
          ),
          const SizedBox(height: 12),
          GridControlsPanel(
            project: project,
          ),
          const SizedBox(height: 12),
          OutputControlsPanel(
            project: project,
          ),
          const SizedBox(height: 12),
          const ExportPdfPanel(),
        ],
      ),
    );
  }
}