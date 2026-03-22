import 'package:flutter/material.dart';
import '../panels/export_pdf_panel.dart';
import '../panels/grid_controls_panel.dart';
import '../panels/image_controls_panel.dart';
import '../panels/output_controls_panel.dart';

class LeftControlColumn extends StatelessWidget {
  const LeftControlColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageControlsPanel(),
          SizedBox(height: 12),
          GridControlsPanel(),
          SizedBox(height: 12),
          OutputControlsPanel(),
          SizedBox(height: 12),
          ExportPdfPanel(),
        ],
      ),
    );
  }
}