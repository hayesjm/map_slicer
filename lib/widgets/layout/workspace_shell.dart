import 'package:flutter/material.dart';
import 'left_control_column.dart';
import 'right_workspace.dart';

class WorkspaceShell extends StatelessWidget {
  const WorkspaceShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF141414),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 320,
            child: LeftControlColumn(),
          ),
          SizedBox(width: 12),
          Expanded(
            child: RightWorkspace(),
          ),
        ],
      ),
    );
  }
}