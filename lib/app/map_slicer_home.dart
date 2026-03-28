import 'package:flutter/material.dart';
import '../controllers/slicer_controller.dart';
import '../model/slicer_project.dart';
import '../widgets/layout/app_header.dart';
import '../widgets/layout/workspace_shell.dart';

class MapSlicerHome extends StatefulWidget {
  const MapSlicerHome({super.key});

  @override
  State<MapSlicerHome> createState() => _MapSlicerHomeState();
}

class _MapSlicerHomeState extends State<MapSlicerHome> {
  late final SlicerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SlicerController(
      project: SlicerProject(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: WorkspaceShell(
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}