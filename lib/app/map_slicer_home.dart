import 'package:flutter/material.dart';
import '../model/slicer_project.dart';
import '../services/image_loader.dart';
import '../widgets/layout/app_header.dart';
import '../widgets/layout/workspace_shell.dart';

class MapSlicerHome extends StatefulWidget {
  const MapSlicerHome({super.key});

  @override
  State<MapSlicerHome> createState() => _MapSlicerHomeState();
}

class _MapSlicerHomeState extends State<MapSlicerHome> {
  final SlicerProject _project = SlicerProject();

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
              project: _project,
              loadedImage: _loadedImage,
              onImageLoaded: _handleImageLoaded,
            ),
          ),
        ],
      ),
    );
  }
}