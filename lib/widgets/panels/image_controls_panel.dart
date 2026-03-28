import 'package:flutter/material.dart';
import '../../model/slicer_project.dart';
import '../../services/image_loader.dart';
import '../controls/file_load_row.dart';
import '../controls/info_value_row.dart';
import '../controls/labeled_switch_row.dart';
import '../controls/slider_number_row.dart';
import 'titled_panel.dart';

class ImageControlsPanel extends StatelessWidget {
  final SlicerProject project;
  final LoadedImageFile? loadedImage;
  final ValueChanged<LoadedImageFile?> onImageLoaded;

  const ImageControlsPanel({
    super.key,
    required this.project,
    required this.loadedImage,
    required this.onImageLoaded,
  });

  Future<void> _handleLoadImage() async {
    final loaded = await ImageLoaderService.pickImage();
    if (loaded == null) return;
    onImageLoaded(loaded);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: project,
      builder: (context, _) {
        final imageName = loadedImage?.fileName ?? 'No file selected';
        final sourceSize = loadedImage == null
            ? '—'
            : '${loadedImage!.pixelWidth} × ${loadedImage!.pixelHeight}';

        return TitledPanel(
          title: 'Image Controls',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              FileLoadRow(
                buttonText: 'Load',
                fileName: imageName,
                onPressed: _handleLoadImage,
              ),

              InfoValueRow(label: 'Source', value: sourceSize),

              SliderNumberRow(
                label: 'Zoom',
                value: project.zoom,
                min: 25,
                max: 300,
                defaultValue: 100,
                divisions: 275,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  project.zoom = value;
                },
              ),

              SliderNumberRow(
                label: 'Offset X',
                value: project.imageOffsetX,
                min: -100,
                max: 100,
                defaultValue: 0,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  project.imageOffsetX = value;
                },
              ),

              SliderNumberRow(
                label: 'Offset Y',
                value: project.imageOffsetY,
                min: -100,
                max: 100,
                defaultValue: 0,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  project.imageOffsetY = value;
                },
              ),

              SliderNumberRow(
                label: 'Bright',
                value: project.brightness,
                min: 0,
                max: 200,
                defaultValue: 100,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  project.brightness = value;
                },
              ),

              SliderNumberRow(
                label: 'Contrast',
                value: project.contrast,
                min: 0,
                max: 200,
                defaultValue: 100,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  project.contrast = value;
                },
              ),

              SliderNumberRow(
                label: 'Sat',
                value: project.saturation,
                min: 0,
                max: 200,
                defaultValue: 100,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  project.saturation = value;
                },
              ),

              SliderNumberRow(
                label: 'Gamma',
                value: project.gamma,
                min: 0.25,
                max: 3.00,
                defaultValue: 1.00,
                divisions: 275,
                decimals: 2,
                units: '',
                onChanged: (value) {
                  project.gamma = value;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
