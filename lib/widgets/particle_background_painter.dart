import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ParticleBackgroundPainter extends CustomPainter {
  final double animationValue;

  ParticleBackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw floating particles
    for (int i = 0; i < 30; i++) {
      final x =
          (size.width * (i * 0.1 + 0.1)) +
          (math.sin(animationValue * 2 * math.pi + i * 0.5) * 50);
      final y =
          (size.height * (i * 0.03 + 0.1)) +
          (math.cos(animationValue * 2 * math.pi + i * 0.7) * 30);

      paint.color = [
        AppColors.neonPurple,
        AppColors.neonBlue,
        AppColors.neonAccent,
        AppColors.neonPink,
        AppColors.neonCyan,
      ][i % 5].withOpacity(0.1);

      canvas.drawCircle(
        Offset(x % size.width, y % size.height),
        2 + (i % 3),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
