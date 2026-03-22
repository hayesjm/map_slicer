import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';

class ModeButtonRow<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<ModeOption<T>> options;
  final ValueChanged<T> onChanged;

  const ModeButtonRow({
    super.key,
    required this.label,
    required this.value,
    required this.options,
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: options.map((option) {
              final bool selected = option.value == value;

              return Padding(
                padding: const EdgeInsets.only(left: 4),
                child: OutlinedButton(
                  onPressed: () => onChanged(option.value),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    minimumSize: const Size(36,36),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),

                    foregroundColor: selected
                        ? AppColors.sliderActive
                        : AppColors.controlValue,
                    side: BorderSide(
                      color: selected
                          ? AppColors.sliderActive
                          : AppColors.panelBorder,
                    ),
                  ),

                  child: option.iconWidget != null
                      ? option.iconWidget!
                      : Text(
                          option.label ?? '',
                          style: TextStyle(
                            fontSize: AppMetrics.controlFontSize,
                          ),
                        ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ModeOption<T> {
  final T value;
  final String? label;
  final Widget? iconWidget;

  const ModeOption({required this.value, this.label, this.iconWidget});
}
