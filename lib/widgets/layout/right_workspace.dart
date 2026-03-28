import 'package:flutter/material.dart';
import '../../controllers/slicer_controller.dart';
import '../../theme/app_metrics.dart';
import '../panels/info_row.dart';
import '../panels/preview_panel.dart';

class RightWorkspace extends StatelessWidget {
  final SlicerController controller;

  const RightWorkspace({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: PreviewPanel(
            controller: controller,
          ),
        ),
        const SizedBox(height: AppMetrics.workspaceGap),
        SizedBox(
          height: AppMetrics.infoRowHeight,
          child: InfoRow(
            controller: controller,
          ),
        ),
      ],
    );
  }
}