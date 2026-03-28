import 'package:flutter/material.dart';
import '../../controllers/slicer_controller.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';
import 'left_control_column.dart';
import 'right_workspace.dart';

class WorkspaceShell extends StatelessWidget {
  final SlicerController controller;

  const WorkspaceShell({
    super.key,
    required this.controller,
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
              controller: controller,
            ),
          ),
          const SizedBox(width: AppMetrics.workspaceGap),
          Expanded(
            child: RightWorkspace(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}