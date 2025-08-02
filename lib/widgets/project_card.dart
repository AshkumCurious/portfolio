import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/global_function.dart';

Widget buildGlowingProjectCard(
  String title,
  String description,
  String emoji,
  String githubUrl,
  int index,
) {
  final gradients = [
    [AppColors.neonPurple, AppColors.neonBlue],
    [AppColors.neonBlue, AppColors.neonCyan],
    [AppColors.neonAccent, AppColors.neonPink],
    [AppColors.neonPink, AppColors.neonPurple],
    [AppColors.neonCyan, AppColors.neonAccent],
    [AppColors.neonPurple, AppColors.neonPink],
  ];

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
      borderRadius: BorderRadius.circular(32),
      border: Border.all(color: gradients[index][0].withOpacity(0.3)),
      boxShadow: [
        BoxShadow(
          color: gradients[index][0].withOpacity(0.2),
          blurRadius: 25,
          offset: Offset(0, 15),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradients[index],
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Text(emoji, style: TextStyle(fontSize: 48)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textColor,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textColor.withOpacity(0.8),
                  height: 1.6,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradients[index]),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: gradients[index][0].withOpacity(0.4),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () => launchURL(githubUrl),
                  icon: Icon(Icons.code, size: 18),
                  label: Text(
                    'View Project',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
