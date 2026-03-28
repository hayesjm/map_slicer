import 'package:flutter/material.dart';
import '../../model/slicer_project.dart';
import '../../services/image_loader.dart';
import '../controls/file_load_row.dart';
import '../controls/info_value_row.dart';
import '../controls/labeled_switch_row.dart';
import '../controls/slider_number_row.dart';
import 'titled_panel.dart';

class ImageControlsPanel extends StatefulWidget {
  final SlicerProject project;
  final LoadedImageFile? loadedImage;
  final ValueChanged<LoadedImageFile?> onImageLoaded;

  const ImageControlsPanel({
    super.key,
    required this.project,
    required this.loadedImage,
    required this.onImageLoaded,
  });

  @override
  State<ImageControlsPanel> createState() => _ImageControlsPanelState();
}

class _ImageControlsPanelState extends State<ImageControlsPanel> {
  Future<void> _handleLoadImage() async {
    final loaded = await ImageLoaderService.pickImage();
    if (loaded == null) return;
    widget.onImageLoaded(loaded);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.project,
      builder: (context, _) {
        final imageName = widget.loadedImage?.fileName ?? 'No file selected';
        final sourceSize = widget.loadedImage == null
            ? '—'
            : '${widget.loadedImage!.pixelWidth} × ${widget.loadedImage!.pixelHeight}';

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
                value: widget.project.zoom,
                min: 25,
                max: 300,
                defaultValue: 100,
                divisions: 275,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  widget.project.zoom = value;
                },
              ),

              SliderNumberRow(
                label: 'Offset X',
                value: widget.project.imageOffsetX,
                min: -100,
                max: 100,
                defaultValue: 0,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  widget.project.imageOffsetX = value;
                },
              ),

              SliderNumberRow(
                label: 'Offset Y',
                value: widget.project.imageOffsetY,
                min: -100,
                max: 100,
                defaultValue: 0,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  widget.project.imageOffsetY = value;
                },
              ),

              SliderNumberRow(
                label: 'Bright',
                value: widget.project.brightness,
                min: 0,
                max: 200,
                defaultValue: 100,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  widget.project.brightness = value;
                },
              ),

              SliderNumberRow(
                label: 'Contrast',
                value: widget.project.contrast,
                min: 0,
                max: 200,
                defaultValue: 100,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  widget.project.contrast = value;
                },
              ),

              SliderNumberRow(
                label: 'Sat',
                value: widget.project.saturation,
                min: 0,
                max: 200,
                defaultValue: 100,
                divisions: 200,
                decimals: 0,
                units: '',
                onChanged: (value) {
                  widget.project.saturation = value;
                },
              ),

              SliderNumberRow(
                label: 'Gamma',
                value: widget.project.gamma,
                min: 0.25,
                max: 3.00,
                defaultValue: 1.00,
                divisions: 275,
                decimals: 2,
                units: '',
                onChanged: (value) {
                  widget.project.gamma = value;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
