import 'package:flutter/material.dart';
import 'package:portfolio_website/main.dart';

import '../theme/app_colors.dart';
import '../utils/global_function.dart';
import 'experience_card.dart';
import 'primary_contact_button.dart';
import 'project_card.dart';
import 'section_title.dart';
import 'stat_card.dart';
import 'tech_card.dart';

Widget buildAboutSection() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 120),
    child: Column(
      children: [
        buildGlowingSectionTitle('About Me'),
        SizedBox(height: 80),
        Container(
          constraints: BoxConstraints(maxWidth: 900),
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.cardColor.withOpacity(0.8),
                AppColors.cardColor.withOpacity(0.6),
              ],
            ),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: AppColors.neonAccent.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.neonPurple.withOpacity(0.2),
                blurRadius: 40,
                offset: Offset(0, 20),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(Icons.psychology, color: AppColors.neonAccent, size: 48),
              SizedBox(height: 24),
              Text(
                'I\'m a passionate Flutter developer who transforms complex ideas into stunning, high-performance mobile experiences. With expertise spanning Flutter, Dart, and modern backend technologies, I create applications that don\'t just work—they inspire.',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.textColor,
                  height: 1.8,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              Wrap(
                spacing: 20,
                children: [
                  buildStatCard('50+', 'Projects'),
                  buildStatCard('3+', 'Years Exp'),
                  buildStatCard('15+', 'Happy Clients'),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildProjectsSection() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 120),
    decoration: BoxDecoration(color: AppColors.cardColor.withOpacity(0.3)),
    child: Column(
      children: [
        buildGlowingSectionTitle('Featured Projects'),
        SizedBox(height: 80),
        Container(
          constraints: BoxConstraints(maxWidth: 1400),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(navigatorKey.currentContext!).size.width > 900
                      ? 3
                      : MediaQuery.of(navigatorKey.currentContext!).size.width >
                          600
                      ? 2
                      : 1,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 0.8,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              final projects = [
                {
                  'title': 'E-Commerce App',
                  'desc': 'Modern shopping experience with seamless checkout',
                  'icon': '🛒',
                },
                {
                  'title': 'Chat Application',
                  'desc': 'Real-time messaging with end-to-end encryption',
                  'icon': '💬',
                },
                {
                  'title': 'Fitness Tracker',
                  'desc': 'Health monitoring with AI-powered insights',
                  'icon': '💪',
                },
                {
                  'title': 'Food Delivery',
                  'desc': 'Location-based ordering with live tracking',
                  'icon': '🍕',
                },
                {
                  'title': 'Music Player',
                  'desc': 'Immersive audio experience with smart playlists',
                  'icon': '🎵',
                },
                {
                  'title': 'Crypto Wallet',
                  'desc':
                      'Secure blockchain transactions and portfolio management',
                  'icon': '₿',
                },
              ];

              return buildGlowingProjectCard(
                projects[index]['title']!,
                projects[index]['desc']!,
                projects[index]['icon']!,
                'https://github.com/ashish/project-${index + 1}',
                index,
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget buildExperienceSection() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 120),
    child: Column(
      children: [
        buildGlowingSectionTitle('Experience Journey'),
        SizedBox(height: 80),
        Container(
          constraints: BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              buildGlowingExperienceCard(
                'Senior Flutter Developer',
                'Tech Innovations Corp',
                '2022 - Present',
                'Leading cross-platform development initiatives, architecting scalable solutions, and mentoring development teams while driving innovation in mobile app development.',
                true,
                AppColors.neonAccent,
              ),
              SizedBox(height: 30),
              buildGlowingExperienceCard(
                'Flutter Developer',
                'Digital Solutions Ltd',
                '2020 - 2022',
                'Developed high-performance mobile applications, integrated complex APIs, and collaborated with design teams for pixel-perfect implementations.',
                false,
                AppColors.neonBlue,
              ),
              SizedBox(height: 30),
              buildGlowingExperienceCard(
                'Backend Developer',
                'Startup Innovations',
                '2019 - 2020',
                'Built scalable Node.js services, designed efficient database architectures, and implemented secure authentication systems for enterprise applications.',
                false,
                AppColors.neonPurple,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildContactSection() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 120),
    child: Column(
      children: [
        buildGlowingSectionTitle('Let\'s Create Magic'),
        SizedBox(height: 80),
        Container(
          constraints: BoxConstraints(maxWidth: 700),
          padding: EdgeInsets.all(60),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.cardColor.withOpacity(0.8),
                AppColors.cardColor.withOpacity(0.6),
              ],
            ),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: AppColors.neonAccent.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.neonPurple.withOpacity(0.3),
                blurRadius: 40,
                offset: Offset(0, 20),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.neonPurple, AppColors.neonBlue],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.neonPurple.withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(Icons.rocket_launch, color: Colors.white, size: 32),
              ),
              SizedBox(height: 24),
              Text(
                'Ready to Build Something Amazing?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textColor,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Let\'s turn your vision into reality with cutting-edge Flutter development.',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textColor.withOpacity(0.8),
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  ContactButton(
                    title: 'Email Me',
                    icon: Icons.email,
                    color: AppColors.neonAccent,
                    onTap: () => launchURL('mailto:ashish@example.com'),
                  ),
                  ContactButton(
                    title: 'LinkedIn',
                    icon: Icons.business,
                    color: AppColors.neonBlue,
                    onTap:
                        () => launchURL('https://linkedin.com/in/ashish-kumar'),
                  ),
                  ContactButton(
                    title: 'GitHub',
                    icon: Icons.code,
                    color: AppColors.neonPurple,
                    onTap: () => launchURL('https://github.com/ashish'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildTechStackSection() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 120),
    child: Column(
      children: [
        buildGlowingSectionTitle('Tech Arsenal'),
        SizedBox(height: 80),
        Container(
          constraints: BoxConstraints(maxWidth: 1200),
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount:
                MediaQuery.of(navigatorKey.currentContext!).size.width > 800
                    ? 4
                    : 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 1.1,
            children: [
              buildGlowingTechCard(
                'Flutter',
                '🚀',
                AppColors.neonBlue,
                'Mobile UI Framework',
              ),
              buildGlowingTechCard(
                'Dart',
                '🎯',
                AppColors.neonAccent,
                'Programming Language',
              ),
              buildGlowingTechCard(
                'Node.js',
                '⚡',
                AppColors.neonCyan,
                'Backend Runtime',
              ),
              buildGlowingTechCard(
                'JavaScript',
                '💫',
                AppColors.neonPink,
                'Web Development',
              ),
              buildGlowingTechCard(
                'Firebase',
                '🔥',
                Colors.orange,
                'Cloud Platform',
              ),
              buildGlowingTechCard(
                'MongoDB',
                '🍃',
                Colors.green,
                'NoSQL Database',
              ),
              buildGlowingTechCard(
                'REST APIs',
                '🌐',
                AppColors.neonPurple,
                'Web Services',
              ),
              buildGlowingTechCard('Git', '📱', Colors.red, 'Version Control'),
            ],
          ),
        ),
      ],
    ),
  );
}
