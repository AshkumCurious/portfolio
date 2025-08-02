import 'package:flutter/material.dart';
import 'package:portfolio_website/theme/app_colors.dart';

Widget buildGlowingExperienceCard(
  String title,
  String company,
  String duration,
  String description,
  bool isActive,
  Color accentColor,
) {
  return Container(
    padding: EdgeInsets.all(40),
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
      border: Border.all(
        color:
            isActive
                ? accentColor.withOpacity(0.5)
                : accentColor.withOpacity(0.2),
        width: isActive ? 2 : 1,
      ),
      boxShadow: [
        BoxShadow(
          color: accentColor.withOpacity(isActive ? 0.3 : 0.1),
          blurRadius: 30,
          offset: Offset(0, 15),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (isActive)
                        Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: accentColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: accentColor,
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textColor,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    company,
                    style: TextStyle(
                      fontSize: 18,
                      color: accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    accentColor.withOpacity(0.2),
                    accentColor.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: accentColor.withOpacity(0.3)),
              ),
              child: Text(
                duration,
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textColor.withOpacity(0.8),
            height: 1.7,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
