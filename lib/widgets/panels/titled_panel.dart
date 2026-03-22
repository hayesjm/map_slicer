import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';

class TitledPanel extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool expandBody;

  const TitledPanel({
    super.key,
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.all(AppMetrics.panelBodyPadding),
    this.expandBody = false,
  });

  @override
  Widget build(BuildContext context) {
    final body = Padding(
      padding: EdgeInsets.zero,
      child: child,
    );

    return Container(
      decoration: BoxDecoration(
        color: AppColors.panelBg,
        borderRadius: BorderRadius.circular(AppMetrics.panelRadius),
        border: Border.all(
          color: AppColors.panelBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppMetrics.panelHeaderHorizontalPadding,
              vertical: AppMetrics.panelHeaderVerticalPadding,
            ),
            decoration: BoxDecoration(
              color: AppColors.panelHeaderBg,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppMetrics.panelRadius),
              ),
              border: Border(
                bottom: BorderSide(
                  color: AppColors.panelBorder,
                ),
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: AppMetrics.panelHeaderFontSize,
                fontWeight: FontWeight.w700,
                color: AppColors.panelHeaderFontColor,
                letterSpacing: AppMetrics.panelHeaderLetterSpacing,
              ),
            ),
          ),
          if (expandBody) Expanded(child: body) else body,
        ],
      ),
    );
  }
}