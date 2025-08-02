import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

Widget buildGlowingSectionTitle(String title) {
  return ShaderMask(
    shaderCallback:
        (bounds) => LinearGradient(
          colors: [
            AppColors.neonPurple,
            AppColors.neonBlue,
            AppColors.neonAccent,
          ],
        ).createShader(bounds),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w900,
        color: Colors.white,
        letterSpacing: -1.5,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
