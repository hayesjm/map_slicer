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
              child: _RectToggle(
                value: value,
                onChanged: onChanged,
              ),
            ),
          ),

          // Fake units column so everything lines up
          const SizedBox(
            width: 0,//AppMetrics.unitsGap,  + AppMetrics.unitsWidth,
          ),
        ],
      ),
    );
  }
}

class _RectToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const _RectToggle({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const double width = AppMetrics.numberFieldWidth;
    const double height = AppMetrics.labelHeight;
    const double thumbWidth = AppMetrics.numberFieldWidth/2;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: width,
        height: height,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: value
              ? AppColors.sliderActive
              : AppColors.sliderInactive,
          borderRadius: BorderRadius.circular(AppMetrics.labelButtonRadius),
          border: Border.all(
            color: AppColors.panelBorder,
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 120),
              alignment:
                  value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: thumbWidth,
                height: double.infinity,
                decoration: BoxDecoration(
                  color:  value
              ? AppColors.white
              : AppColors.controlValue,
                  borderRadius: BorderRadius.circular(AppMetrics.labelButtonRadius - 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}