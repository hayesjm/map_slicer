import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';

class LabeledSwitchRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const LabeledSwitchRow({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
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
                color: AppColors.controlValue,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),

          const SizedBox(width: AppMetrics.controlGap),

          // Number field column width
          SizedBox(
            width: AppMetrics.numberFieldWidth,
            child: Align(
              alignment: Alignment.centerRight,
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.sliderActive,
                inactiveThumbColor: AppColors.controlValue,
                inactiveTrackColor: AppColors.sliderInactive,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),

          // Fake units column so everything lines up
          const SizedBox(
            width: AppMetrics.unitsGap + AppMetrics.unitsWidth,
          ),
        ],
      ),
    );
  }
}