import 'package:flutter/material.dart';
import 'package:portfolio_website/app_widgets.dart/logo.dart';
import 'package:portfolio_website/app_widgets.dart/menu.dart';
import 'package:portfolio_website/utils/responsive_utils.dart';

import 'hero_section.dart';

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
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            // Using responsive padding
            padding: context.responsivePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.responsiveWidget(
                  mobile: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Logo(), const Menu()],
                  ),
                  desktop: Row(
                    children: [const Logo(), const Spacer(), const Menu()],
                  ),
                ),
                SizedBox(
                  height: context.responsiveSpacing(
                    mobile: 40.0,
                    tablet: 60.0,
                    desktop: 80.0,
                    largeDesktop: 100.0,
                  ),
                ),
                // Hero Section
                const HeroSection(),
                // Add spacing for future sections
                SizedBox(
                  height: context.responsiveSpacing(
                    mobile: 60.0,
                    tablet: 80.0,
                    desktop: 100.0,
                    largeDesktop: 120.0,
                  ),
                ),
                // Add your other sections here
                _buildAboutSection(),
                _buildProjectsSection(),
                // _buildContactSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Example of additional sections you can add
  Widget _buildAboutSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        context.responsiveSpacing(mobile: 20.0, tablet: 30.0, desktop: 40.0),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: context.responsiveBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Me",
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              fontSize: context.responsiveFontSize(
                mobile: 24.0,
                tablet: 28.0,
                desktop: 32.0,
              ),
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: context.responsiveSpacing(mobile: 16.0, desktop: 20.0),
          ),
          Text(
            "I am a passionate UI/UX designer with over 5 years of experience in creating beautiful and functional digital experiences. I love turning complex problems into simple, beautiful, and intuitive designs.",
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              fontSize: context.responsiveFontSize(
                mobile: 16.0,
                tablet: 18.0,
                desktop: 18.0,
              ),
              height: 1.6,
              color: const Color(0xFF959595),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Projects",
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
            fontSize: context.responsiveFontSize(
              mobile: 24.0,
              tablet: 28.0,
              desktop: 32.0,
            ),
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: context.responsiveSpacing(mobile: 20.0, desktop: 30.0),
        ),
        // Add your project cards here
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.responsiveValue(
              mobile: 1,
              tablet: 2,
              desktop: 3,
            ),
            crossAxisSpacing: context.responsiveSpacing(
              mobile: 16.0,
              desktop: 24.0,
            ),
            mainAxisSpacing: context.responsiveSpacing(
              mobile: 16.0,
              desktop: 24.0,
            ),
            childAspectRatio: 1.2,
          ),
          itemCount: 6, // Replace with your actual project count
          itemBuilder: (context, index) {
            return _buildProjectCard(context, index);
          },
        ),
      ],
    );
  }

  Widget _buildProjectCard(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: context.responsiveBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: context.responsiveElevation,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: context.responsiveBorderRadius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                color: const Color(0xFF3A3A3A),
                child: const Icon(
                  Icons.image,
                  size: 48,
                  color: Color(0xFF666666),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(
                  context.responsiveSpacing(mobile: 12.0, desktop: 16.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Project ${index + 1}",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                        fontSize: context.responsiveFontSize(
                          mobile: 16.0,
                          desktop: 18.0,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "UI/UX Design",
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                        fontSize: context.responsiveFontSize(
                          mobile: 14.0,
                          desktop: 14.0,
                        ),
                        color: const Color(0xFF959595),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
