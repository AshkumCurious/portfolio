import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

Widget buildNavItem(String title, VoidCallback onTap) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.transparent),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    ),
  );
}
