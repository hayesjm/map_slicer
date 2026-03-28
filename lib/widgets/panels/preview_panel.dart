import 'package:flutter/material.dart';
import '../../model/slicer_project.dart';
import '../../services/image_loader.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';
import 'titled_panel.dart';

class PreviewPanel extends StatelessWidget {
  final SlicerProject project;
  final LoadedImageFile? loadedImage;

  const PreviewPanel({
    super.key,
    required this.project,
    required this.loadedImage,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: project,
      builder: (context, _) {
        return TitledPanel(
          title: 'Preview',
          expandBody: true,
          useBodyPadding: true,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(AppMetrics.panelRadius),
              border: Border.all(
                color: AppColors.panelBorder,
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final availableWidth = constraints.maxWidth;
                final availableHeight = constraints.maxHeight;

                if (availableWidth <= 0 || availableHeight <= 0) {
                  return const SizedBox.shrink();
                }

                final stageSize = _fitStageSize(
                  availableWidth: availableWidth,
                  availableHeight: availableHeight,
                  targetAspectRatio: project.printedAspectRatio,
                );

                return Center(
                  child: Container(
                    width: stageSize.width,
                    height: stageSize.height,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.18),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: loadedImage == null
                        ? const Center(
                            child: Text(
                              'No image loaded',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                              ),
                            ),
                          )
                        : Image.memory(
                            loadedImage!.bytes,
                            fit: BoxFit.cover,
                          ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

Size _fitStageSize({
  required double availableWidth,
  required double availableHeight,
  required double targetAspectRatio,
}) {
  if (targetAspectRatio <= 0) {
    return Size(availableWidth, availableHeight);
  }

  final availableAspectRatio = availableWidth / availableHeight;

  if (availableAspectRatio > targetAspectRatio) {
    final height = availableHeight;
    final width = height * targetAspectRatio;
    return Size(width, height);
  } else {
    final width = availableWidth;
    final height = width / targetAspectRatio;
    return Size(width, height);
  }
}