import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

Widget buildGlowButton(
  String text,
  IconData icon,
  VoidCallback onTap, {
  required bool isPrimary,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow:
          isPrimary
              ? [
                BoxShadow(
                  color: AppColors.neonPurple.withOpacity(0.5),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ]
              : null,
    ),
    child: ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? AppColors.neonPurple : Colors.transparent,
        foregroundColor: Colors.white,
        side:
            isPrimary
                ? null
                : BorderSide(
                  color: AppColors.neonAccent.withOpacity(0.5),
                  width: 2,
                ),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
      ),
    ),
  );
}
