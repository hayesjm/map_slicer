import 'package:flutter/material.dart';
import '../../controllers/slicer_controller.dart';
import '../controls/info_value_row.dart';
import 'titled_panel.dart';

class ImageInfoPanel extends StatelessWidget {
  final SlicerController controller;

  const ImageInfoPanel({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final loadedImage = controller.loadedImage;

        return TitledPanel(
          title: 'Image Info',
          expandBody: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              InfoValueRow(
                label: 'File',
                value: controller.imageName,
              ),
              InfoValueRow(
                label: 'Source',
                value: controller.sourceSize,
              ),
              InfoValueRow(
                label: 'Zoom',
                value: '${controller.project.zoom.toStringAsFixed(0)}%',
              ),
              InfoValueRow(
                label: 'Offset X',
                value: '${controller.project.imageOffsetX.toStringAsFixed(0)}%',
              ),
              InfoValueRow(
                label: 'Offset Y',
                value: '${controller.project.imageOffsetY.toStringAsFixed(0)}%',
              ),
              if (loadedImage != null)
                InfoValueRow(
                  label: 'Aspect',
                  value: (loadedImage.pixelWidth / loadedImage.pixelHeight)
                      .toStringAsFixed(3),
                ),
            ],
          ),
        );
      },
    );
  }
}