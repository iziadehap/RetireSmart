import 'package:flutter/material.dart';
import '../../data/models/inflation_model.dart';

class DotGridPainter extends CustomPainter {
  final Color color;
  final double spacing;
  final double opacity;
  DotGridPainter({
    required this.color,
    this.spacing = 30.0,
    this.opacity = 0.05,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.fill;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class InflationChartPainter extends CustomPainter {
  final List<Estimate> estimates;
  final Color lineColor;
  final Color gridColor;
  final Color dotStrokeColor;

  InflationChartPainter({
    required this.estimates,
    required this.lineColor,
    this.gridColor = Colors.white,
    this.dotStrokeColor = const Color(0xFF0A0A0A),
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (estimates.length < 2) return;

    // --- Background Grid/Lines ---
    final gridPaint = Paint()
      ..color = gridColor.withOpacity(0.05)
      ..strokeWidth = 0.5;

    for (int i = 0; i <= 4; i++) {
      double y = size.height * (i / 4);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // --- Data Path Logic ---
    final path = Path();
    final fillPath = Path();

    // Calculate scaling
    double maxX = estimates.length.toDouble() - 1;
    double minY = estimates
        .map((e) => e.inflation ?? 0)
        .reduce((a, b) => a < b ? a : b);
    double maxY = estimates
        .map((e) => e.inflation ?? 0)
        .reduce((a, b) => a > b ? a : b);

    // Dynamic padding for min/max
    minY = minY * 0.9;
    maxY = maxY * 1.1;

    double xStep = size.width / maxX;
    double yRange = maxY - minY;

    List<Offset> points = [];
    for (int i = 0; i < estimates.length; i++) {
      double x = i * xStep;
      double y =
          size.height -
          ((estimates[i].inflation! - minY) / yRange * size.height);
      points.add(Offset(x, y));
    }

    // Smooth Path with Cubic Bezier
    path.moveTo(points[0].dx, points[0].dy);
    fillPath.moveTo(points[0].dx, size.height);
    fillPath.lineTo(points[0].dx, points[0].dy);

    for (int i = 0; i < points.length - 1; i++) {
      double x1 = points[i].dx;
      double y1 = points[i].dy;
      double x2 = points[i + 1].dx;
      double y2 = points[i + 1].dy;

      double cx1 = x1 + (x2 - x1) / 2;
      double cx2 = x1 + (x2 - x1) / 2;

      path.cubicTo(cx1, y1, cx2, y2, x2, y2);
      fillPath.cubicTo(cx1, y1, cx2, y2, x2, y2);
    }

    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    // --- Layer 1: Fill Gradient ---
    final fillGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        lineColor.withOpacity(0.3),
        lineColor.withOpacity(0.1),
        Colors.transparent,
      ],
      stops: const [0.0, 0.5, 1.0],
    );
    canvas.drawPath(
      fillPath,
      Paint()
        ..shader = fillGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        ),
    );

    // --- Layer 2: Outer Glow ---
    final glowPaint = Paint()
      ..color = lineColor.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawPath(path, glowPaint);

    // --- Layer 3: Main Neon Line ---
    final mainLinePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final lineGradient = LinearGradient(
      colors: [
        lineColor.withOpacity(0.5),
        lineColor,
        lineColor.withOpacity(0.5),
      ],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    mainLinePaint.shader = lineGradient;

    canvas.drawPath(path, mainLinePaint);

    // --- Layer 4: Interactive-style Data Dots ---
    final dotPaint = Paint()..style = PaintingStyle.fill;
    final dotStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = dotStrokeColor;

    for (int i = 0; i < points.length; i++) {
      if (i == 0 ||
          i == (maxX).round() ||
          (maxX > 4 && (i % (maxX / 4).round()) == 0)) {
        canvas.drawCircle(
          points[i],
          6,
          Paint()..color = lineColor.withOpacity(0.2),
        );
        dotPaint.color = lineColor;
        canvas.drawCircle(points[i], 3, dotPaint);
        canvas.drawCircle(points[i], 3, dotStroke);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
