import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';

class InfoValueRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoValueRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppMetrics.infoRowVerticalPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: AppMetrics.controlFontSize,
                color: AppColors.controlValue,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          //const SizedBox(width: AppMetrics.controlGap),
          Text(
            value,
            style: TextStyle(
              fontSize: AppMetrics.controlFontSize,
              color: AppColors.controlValue,
            ),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
