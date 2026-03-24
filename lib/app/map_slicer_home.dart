import 'package:flutter/material.dart';
import '../services/image_loader.dart';
import '../widgets/layout/app_header.dart';
import '../widgets/layout/workspace_shell.dart';

class MapSlicerHome extends StatefulWidget {
  const MapSlicerHome({super.key});

  @override
  State<MapSlicerHome> createState() => _MapSlicerHomeState();
}

class _MapSlicerHomeState extends State<MapSlicerHome> {
  LoadedImageFile? _loadedImage;

  void _handleImageLoaded(LoadedImageFile? image) {
    setState(() {
      _loadedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: WorkspaceShell(
              loadedImage: _loadedImage,
              onImageLoaded: _handleImageLoaded,
            ),
          ),
        ],
      ),
    );
  }
}