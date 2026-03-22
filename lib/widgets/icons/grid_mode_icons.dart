import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class GridModeNoneIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const GridModeNoneIcon({
    super.key,
    this.size = 16,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GridModeNonePainter(
          color: color ?? AppColors.controlValue,
        ),
      ),
    );
  }
}

class GridModeSquareIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const GridModeSquareIcon({
    super.key,
    this.size = 16,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GridModeSquarePainter(
          color: color ?? AppColors.controlValue,
        ),
      ),
    );
  }
}

class GridModeIsoIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const GridModeIsoIcon({
    super.key,
    this.size = 16,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _GridModeIsoPainter(
          color: color ?? AppColors.controlValue,
        ),
      ),
    );
  }
}

class _GridModeNonePainter extends CustomPainter {
  final Color color;

  _GridModeNonePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final slash = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(1, 1, size.width - 2, size.height - 2);
    canvas.drawRect(rect, stroke);

    canvas.drawLine(
      Offset(3, size.height - 3),
      Offset(size.width - 3, 3),
      slash,
    );
  }

  @override
  bool shouldRepaint(covariant _GridModeNonePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _GridModeSquarePainter extends CustomPainter {
  final Color color;

  _GridModeSquarePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1;

    final left = 1.0;
    final top = 1.0;
    final right = size.width - 1.0;
    final bottom = size.height - 1.0;

    canvas.drawRect(
      Rect.fromLTRB(left, top, right, bottom),
      paint,
    );

    final x1 = left + (right - left) / 3;
    final x2 = left + 2 * (right - left) / 3;
    final y1 = top + (bottom - top) / 3;
    final y2 = top + 2 * (bottom - top) / 3;

    canvas.drawLine(Offset(x1, top), Offset(x1, bottom), paint);
    canvas.drawLine(Offset(x2, top), Offset(x2, bottom), paint);
    canvas.drawLine(Offset(left, y1), Offset(right, y1), paint);
    canvas.drawLine(Offset(left, y2), Offset(right, y2), paint);
  }

  @override
  bool shouldRepaint(covariant _GridModeSquarePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _GridModeIsoPainter extends CustomPainter {
  final Color color;

  _GridModeIsoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1
      ..strokeCap = StrokeCap.round;

    final w = size.width;
    final h = size.height;

    // Border
    canvas.drawRect(
      Rect.fromLTWH(1, 1, w - 2, h - 2),
      paint,
    );

    // Three families of lines to suggest iso grid
    canvas.drawLine(Offset(w * 0.15, h - 2), Offset(w * 0.50, 2), paint);
    canvas.drawLine(Offset(w * 0.50, h - 2), Offset(w * 0.85, 2), paint);

    canvas.drawLine(Offset(2, h * 0.35), Offset(w * 0.65, h - 2), paint);
    canvas.drawLine(Offset(w * 0.35, 2), Offset(w - 2, h * 0.65), paint);

    canvas.drawLine(Offset(2, h * 0.65), Offset(w * 0.65, 2), paint);
    canvas.drawLine(Offset(w * 0.35, h - 2), Offset(w - 2, h * 0.35), paint);
  }

  @override
  bool shouldRepaint(covariant _GridModeIsoPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}