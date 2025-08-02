import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

Widget buildStatCard(String number, String label) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppColors.neonPurple.withOpacity(0.2),
          AppColors.neonBlue.withOpacity(0.2),
        ],
      ),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.neonAccent.withOpacity(0.3)),
    ),
    child: Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: AppColors.neonAccent,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textColor.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
