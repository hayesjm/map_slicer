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
              style: const TextStyle(
                fontSize: AppMetrics.controlFontSize,
                color: AppColors.controlLabel,
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
                      horizontal: 10,
                      vertical: 6,
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
                  child: option.icon != null
                      ? Icon(option.icon, size: 16)
                      : Text(option.label ?? ''),
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
  final IconData? icon;

  const ModeOption({
    required this.value,
    this.label,
    this.icon,
  });
}