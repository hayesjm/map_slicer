import 'package:flutter/material.dart';
import '../../model/slicer_project.dart';
import '../../services/image_loader.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';
import 'left_control_column.dart';
import 'right_workspace.dart';

class WorkspaceShell extends StatelessWidget {
  final SlicerProject project;
  final LoadedImageFile? loadedImage;
  final ValueChanged<LoadedImageFile?> onImageLoaded;

  const WorkspaceShell({
    super.key,
    required this.project,
    required this.loadedImage,
    required this.onImageLoaded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.workspaceBg,
      padding: const EdgeInsets.all(AppMetrics.workspaceGap),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: AppMetrics.leftColumnWidth,
            child: LeftControlColumn(
              project: project,
              loadedImage: loadedImage,
              onImageLoaded: onImageLoaded,
            ),
          ),
          const SizedBox(width: AppMetrics.workspaceGap),
          Expanded(
            child: RightWorkspace(
              project: project,
              loadedImage: loadedImage,
            ),
          ),
        ],
      ),
    );
  }
}