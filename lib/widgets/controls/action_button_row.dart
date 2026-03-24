import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';

class ActionButtonRow extends StatelessWidget {
  final String label;
  final String buttonText;
  final VoidCallback onPressed;

  const ActionButtonRow({
    super.key,
    required this.label,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppMetrics.controlRowVerticalPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: AppMetrics.controlFontSize,
                color: AppColors.controlLabel,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),

          const SizedBox(width: AppMetrics.controlGap),

          OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppMetrics.labelButtonRadius),
              ),
              foregroundColor: AppColors.controlValue,
              side: BorderSide(color: AppColors.panelBorder),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: AppMetrics.controlFontSize,
                color: AppColors.controlValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}