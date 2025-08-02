import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/about_section.dart';
import '../widgets/button.dart';
import '../widgets/nav_item.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            buildHeader(),
            buildHeroSection(),
            buildAboutSection(),
            buildTechStackSection(),
            buildProjectsSection(),
            buildExperienceSection(),
            buildContactSection(),
            buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.cardColor.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: AppColors.neonAccent.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.neonPurple, AppColors.neonBlue],
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neonPurple.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  'Ashish Kumar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          if (MediaQuery.of(context).size.width > 600)
            Row(
              children: [
                buildNavItem('About', () => _scrollToSection(1)),
                buildNavItem('Skills', () => _scrollToSection(2)),
                buildNavItem('Projects', () => _scrollToSection(3)),
                buildNavItem('Experience', () => _scrollToSection(4)),
                buildNavItem('Contact', () => _scrollToSection(5)),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildHeroSection() {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile avatar with clean design
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.neonPurple, AppColors.neonBlue],
                ),
                borderRadius: BorderRadius.circular(70),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.neonPurple.withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'AK',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),

            // Name with gradient text
            ShaderMask(
              shaderCallback:
                  (bounds) => LinearGradient(
                    colors: [
                      AppColors.neonPurple,
                      AppColors.neonBlue,
                      AppColors.neonAccent,
                    ],
                  ).createShader(bounds),
              child: Text(
                'Hey, I\'m Ashish Kumar',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 600 ? 56 : 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 24),

            // Subtitle with clean card design
            Container(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.cardColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: AppColors.neonAccent.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.code, color: AppColors.neonAccent, size: 20),
                  SizedBox(width: 12),
                  Text(
                    'Flutter Developer • UI/UX Enthusiast',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),

            // CTA buttons
            Wrap(
              spacing: 20,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                buildElegantButton(
                  'View My Work',
                  Icons.rocket_launch,
                  () => _scrollToSection(3),
                  isPrimary: true,
                ),
                buildElegantButton(
                  'Get In Touch',
                  Icons.message,
                  () => _scrollToSection(5),
                  isPrimary: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildElegantButton(
    String text,
    IconData icon,
    VoidCallback onPressed, {
    required bool isPrimary,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient:
            isPrimary
                ? LinearGradient(
                  colors: [AppColors.neonPurple, AppColors.neonBlue],
                )
                : null,
        color: isPrimary ? null : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border:
            isPrimary
                ? null
                : Border.all(
                  color: AppColors.neonAccent.withOpacity(0.5),
                  width: 2,
                ),
        boxShadow:
            isPrimary
                ? [
                  BoxShadow(
                    color: AppColors.neonPurple.withOpacity(0.4),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  ),
                ]
                : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white, size: 20),
                SizedBox(width: 12),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border(
          top: BorderSide(
            color: AppColors.neonAccent.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, color: AppColors.neonPink, size: 20),
              SizedBox(width: 8),
              Text(
                'Crafted with Flutter & Passion',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            '© 2024 Ashish Kumar. All rights reserved.',
            style: TextStyle(
              color: AppColors.textColor.withOpacity(0.6),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToSection(int section) {
    double offset = 0;
    switch (section) {
      case 1: // About
        offset = MediaQuery.of(context).size.height * 1.0;
        break;
      case 2: // Tech Stack
        offset = MediaQuery.of(context).size.height * 1.8;
        break;
      case 3: // Projects
        offset = MediaQuery.of(context).size.height * 2.6;
        break;
      case 4: // Experience
        offset = MediaQuery.of(context).size.height * 4.0;
        break;
      case 5: // Contact
        offset = MediaQuery.of(context).size.height * 5.2;
        break;
    }

    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }
}
