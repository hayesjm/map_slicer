import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';

class FileLoadRow extends StatelessWidget {
  final String buttonText;
  final String fileName;
  final VoidCallback onPressed;

  const FileLoadRow({
    super.key,
    required this.buttonText,
    required this.fileName,
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
          SizedBox(
            width: AppMetrics.labelWidth,
            height: AppMetrics.labelHeight,
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(
                  AppMetrics.labelWidth,
                  AppMetrics.labelHeight,
                ),
                maximumSize: const Size(
                  AppMetrics.labelWidth,
                  AppMetrics.labelHeight,
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                backgroundColor: AppColors.resetIdleFill,
                foregroundColor: AppColors.controlLabel,
                side: BorderSide(color: AppColors.resetIdleBorder),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppMetrics.labelButtonRadius,
                  ),
                ),
              ),
              child: Text(
                buttonText,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: TextStyle(
                  color: AppColors.controlLabel,
                  fontSize: AppMetrics.controlFontSize,
                ),
              ),
            ),
          ),

          const SizedBox(width: AppMetrics.controlGap),

          Expanded(
            child: Container(
              height: AppMetrics.labelHeight,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 6),

              decoration: BoxDecoration(
                border: Border.all(color: AppColors.valueBorder),
                borderRadius: BorderRadius.circular(
                  AppMetrics.labelButtonRadius,
                ),
              ),
              child: Text(
                fileName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: AppColors.controlValue,
                  fontSize: AppMetrics.controlFontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
