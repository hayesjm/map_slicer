import 'package:flutter/material.dart';
import '../../controllers/slicer_controller.dart';
import '../../logic/slicer_geometry.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';
import 'titled_panel.dart';

class PreviewPanel extends StatelessWidget {
  final SlicerController controller;

  const PreviewPanel({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return TitledPanel(
          title: 'Preview',
          expandBody: true,
          useBodyPadding: true,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(AppMetrics.panelRadius),
              border: Border.all(color: AppColors.panelBorder),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final availableWidth = constraints.maxWidth;
                final availableHeight = constraints.maxHeight;

                if (availableWidth <= 0 || availableHeight <= 0) {
                  return const SizedBox.shrink();
                }

                final loadedImage = controller.loadedImage;
                if (loadedImage == null) {
                  return const Center(
                    child: Text(
                      'No image loaded',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                    ),
                  );
                }

                final composition = computeSlicerComposition(
                  project: controller.project,
                  viewportWidth: availableWidth,
                  viewportHeight: availableHeight,
                  sourceImageWidth: loadedImage.pixelWidth.toDouble(),
                  sourceImageHeight: loadedImage.pixelHeight.toDouble(),
                );

                return Stack(
                  children: [
                    Positioned.fromRect(
                      rect: composition.stageRect,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.18),
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            Positioned(
                              left: composition.imageRect.left - composition.stageRect.left,
                              top: composition.imageRect.top - composition.stageRect.top,
                              width: composition.imageRect.width,
                              height: composition.imageRect.height,
                              child: Image.memory(
                                loadedImage.bytes,
                                fit: controller.project.stretchImage
                                    ? BoxFit.fill
                                    : BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}