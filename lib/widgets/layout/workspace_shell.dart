import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';
import 'left_control_column.dart';
import 'right_workspace.dart';

class WorkspaceShell extends StatelessWidget {
  const WorkspaceShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.workspaceBg,
      padding: const EdgeInsets.all(AppMetrics.workspaceGap),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(
            width: AppMetrics.leftColumnWidth,
            child: LeftControlColumn(),
          ),
          SizedBox(width: AppMetrics.workspaceGap),
          Expanded(
            child: RightWorkspace(),
          ),
        ],
      ),
    );
  }
}