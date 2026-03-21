import 'package:flutter/material.dart';
import '../panels/info_row.dart';
import '../panels/preview_panel.dart';

class RightWorkspace extends StatelessWidget {
  const RightWorkspace({super.key});

  static const double infoRowHeight = 170;

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