import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_metrics.dart';

class SliderNumberRow extends StatefulWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final double defaultValue;
  final ValueChanged<double>? onChanged;
  final String? units;
  final int? divisions;
  final int decimals;

  const SliderNumberRow({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.defaultValue,
    required this.onChanged,
    this.units,
    this.divisions,
    this.decimals = 2,
  });

  @override
  State<SliderNumberRow> createState() => _SliderNumberRowState();
}

class _SliderNumberRowState extends State<SliderNumberRow> {
  static const double _defaultTolerance = 0.0001;

  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  bool get _isAtDefault =>
      (widget.value - widget.defaultValue).abs() < _defaultTolerance;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _formatValue(widget.value));
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(covariant SliderNumberRow oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_focusNode.hasFocus && oldWidget.value != widget.value) {
      _controller.text = _formatValue(widget.value);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      _commitTextValue();
    }
  }

  String _formatValue(double value) {
    return value.toStringAsFixed(widget.decimals);
  }

  double _clamp(double value) {
    if (value < widget.min) return widget.min;
    if (value > widget.max) return widget.max;
    return value;
  }

  void _setValue(double nextValue) {
    final clamped = _clamp(nextValue);
    widget.onChanged?.call(clamped);

    if (!_focusNode.hasFocus) {
      _controller.text = _formatValue(clamped);
    }
  }

  void _commitTextValue() {
    final parsed = double.tryParse(_controller.text);

    if (parsed == null) {
      _controller.text = _formatValue(widget.value);
      return;
    }

    final clamped = _clamp(parsed);
    widget.onChanged?.call(clamped);
    _controller.text = _formatValue(clamped);
  }

  void _resetToDefault() {
    final resetValue = _clamp(widget.defaultValue);
    widget.onChanged?.call(resetValue);
    _controller.text = _formatValue(resetValue);
  }

  @override
  Widget build(BuildContext context) {
    final Color buttonBorderColor = _isAtDefault
        ? AppColors.resetIdleBorder
        : AppColors.resetDirtyBorder;

    final Color buttonBackgroundColor = _isAtDefault
        ? AppColors.resetIdleFill
        : AppColors.resetDirtyFill;

    final Color buttonForegroundColor = _isAtDefault
        ? AppColors.controlLabel.withValues(alpha: 0.85)
        : AppColors.controlLabel;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppMetrics.controlRowVerticalPadding,
        horizontal: 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: AppMetrics.labelWidth,
            height: AppMetrics.labelHeight,
            child: OutlinedButton(
              onPressed: _resetToDefault,
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
                backgroundColor: buttonBackgroundColor,
                foregroundColor: buttonForegroundColor,
                side: BorderSide(color: buttonBorderColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppMetrics.labelButtonRadius,
                  ),
                ),
              ),
              child: Text(
                widget.label,
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
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: AppColors.sliderActive,
                inactiveTrackColor: AppColors.sliderInactive,
              ),
              child: Slider(
                value: _clamp(widget.value),
                min: widget.min,
                max: widget.max,
                divisions: widget.divisions,
                padding: EdgeInsets.zero,
                onChanged: _setValue,
              ),
            ),
          ),
          const SizedBox(width: AppMetrics.controlGap),
          SizedBox(
            width: AppMetrics.numberFieldWidth,
            height: AppMetrics.labelHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.valueBorder),
                borderRadius: BorderRadius.circular(
                  AppMetrics.labelButtonRadius,
                ),
              ),
              child: Center(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppColors.controlValue,
                    fontSize: AppMetrics.controlFontSize,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 4),
                    border: InputBorder.none,
                  ),
                  onTap: () {
                    _controller.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: _controller.text.length,
                    );
                  },
                  onSubmitted: (_) => _commitTextValue(),
                ),
              ),
            ),
          ),
          if (widget.units != null && widget.units!.isNotEmpty) ...[
            const SizedBox(width: AppMetrics.unitsGap),
            SizedBox(
              width: AppMetrics.unitsWidth,
              child: Text(
                widget.units!,
                style: TextStyle(
                  fontSize: AppMetrics.controlFontSize,
                  color: AppColors.controlUnits,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
