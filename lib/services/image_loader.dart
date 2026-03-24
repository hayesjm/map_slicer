import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';

class LoadedImageFile {
  final String fileName;
  final String? filePath;
  final Uint8List bytes;
  final int pixelWidth;
  final int pixelHeight;

  const LoadedImageFile({
    required this.fileName,
    required this.filePath,
    required this.bytes,
    required this.pixelWidth,
    required this.pixelHeight,
  });
}

class ImageLoaderService {
  static Future<LoadedImageFile?> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      withData: true,
    );

    if (result == null || result.files.isEmpty) {
      return null;
    }

    final file = result.files.single;
    final bytes = file.bytes;

    if (bytes == null) {
      return null;
    }

    final descriptor = await ui.ImageDescriptor.encoded(
      await ui.ImmutableBuffer.fromUint8List(bytes),
    );

    final loaded = LoadedImageFile(
      fileName: file.name,
      filePath: file.path,
      bytes: bytes,
      pixelWidth: descriptor.width,
      pixelHeight: descriptor.height,
    );

    descriptor.dispose();
    return loaded;
  }
}