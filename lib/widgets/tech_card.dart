import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

Widget buildGlowingTechCard(
  String title,
  String emoji,
  Color color,
  String subtitle,
) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.cardColor.withOpacity(0.8),
          AppColors.cardColor.withOpacity(0.6),
        ],
      ),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: color.withOpacity(0.3)),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.2),
          blurRadius: 20,
          offset: Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.2), color.withOpacity(0.1)],
            ),
            shape: BoxShape.circle,
          ),
          child: Text(emoji, style: TextStyle(fontSize: 32)),
        ),
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textColor.withOpacity(0.6),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
