import 'package:flutter/material.dart';
import '../../model/slicer_project.dart';
import '../../services/image_loader.dart';
import '../../theme/app_metrics.dart';
import '../panels/info_row.dart';
import '../panels/preview_panel.dart';

class RightWorkspace extends StatelessWidget {
  final SlicerProject project;
  final LoadedImageFile? loadedImage;

  const RightWorkspace({
    super.key,
    required this.project,
    required this.loadedImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: PreviewPanel(
            project: project,
            loadedImage: loadedImage,
          ),
        ),
        const SizedBox(height: AppMetrics.workspaceGap),
        SizedBox(
          height: AppMetrics.infoRowHeight,
          child: InfoRow(
            project: project,
            loadedImage: loadedImage,
          ),
        ),
      ],
    );
  }
}