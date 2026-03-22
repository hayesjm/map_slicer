import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';

class TitledPanel extends StatelessWidget {
  final String title;
  final Widget child;
  final bool expandBody;
  final bool useBodyPadding;

  const TitledPanel({
    super.key,
    required this.title,
    required this.child,
    this.expandBody = false,
    this.useBodyPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    final Widget panelBody = useBodyPadding
        ? Padding(
            padding: const EdgeInsets.all(AppMetrics.panelBodyPadding),
            child: child,
          )
        : child;

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
              style: const TextStyle(
                fontSize: AppMetrics.panelHeaderFontSize,
                fontWeight: FontWeight.w700,
                letterSpacing: AppMetrics.panelHeaderLetterSpacing,
              ),
            ),
          ),
          if (expandBody) Expanded(child: panelBody) else panelBody,
        ],
      ),
    );
  }
}