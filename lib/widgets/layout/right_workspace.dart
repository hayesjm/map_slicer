import 'package:flutter/material.dart';
import '../panels/info_row.dart';
import '../panels/preview_panel.dart';
import '../../theme/app_metrics.dart';

class RightWorkspace extends StatelessWidget {
  const RightWorkspace({super.key});

  static const double infoRowHeight = AppMetrics.infoRowHeight;

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: PreviewPanel(),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: infoRowHeight,
          child: InfoRow(),
        ),
      ],
    );
  }
}