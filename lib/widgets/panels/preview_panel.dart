import 'package:flutter/material.dart';
import '../../services/image_loader.dart';
import 'titled_panel.dart';

class PreviewPanel extends StatelessWidget {
  final LoadedImageFile? loadedImage;

  const PreviewPanel({
    super.key,
    required this.loadedImage,
  });

  @override
  Widget build(BuildContext context) {
    return TitledPanel(
      title: 'Preview',
      expandBody: true,
      useBodyPadding: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white24,
          ),
        ),
        child: loadedImage == null
            ? const Center(
                child: Text(
                  'Preview Area\n(No image loaded)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                  ),
                ),
              )
            : Center(
                child: Image.memory(
                  loadedImage!.bytes,
                  fit: BoxFit.contain,
                ),
              ),
      ),
    );
  }
}