import 'package:flutter/material.dart';
import '../widgets/layout/app_header.dart';
import '../widgets/layout/workspace_shell.dart';

class MapSlicerHome extends StatelessWidget {
  const MapSlicerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppHeader(),
          Expanded(
            child: WorkspaceShell(),
          ),
        ],
      ),
    );
  }
}