import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/responsive_utils.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        context.responsiveSpacing(mobile: 20.0, tablet: 40.0, desktop: 60.0),
      ),
      child: context.responsiveWidget(
        mobile: _buildMobileLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfileImage(context),
        SizedBox(height: context.responsiveSpacing(mobile: 30.0, tablet: 35.0)),
        _buildIntroText(context),
        SizedBox(height: context.responsiveSpacing(mobile: 25.0, tablet: 30.0)),
        _buildActionButtons(context),
        SizedBox(height: context.responsiveSpacing(mobile: 30.0, tablet: 35.0)),
        _buildStatsSection(context),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        // Left side - Text content
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIntroText(context),
              SizedBox(
                height: context.responsiveSpacing(
                  mobile: 25.0,
                  tablet: 30.0,
                  desktop: 30.0,
                  largeDesktop: 40.0,
                ),
              ),
              _buildSocialIcons(context),
              SizedBox(
                height: context.responsiveSpacing(
                  mobile: 25.0,
                  tablet: 30.0,
                  desktop: 30.0,
                  largeDesktop: 40.0,
                ),
              ),
              _buildActionButtons(context),
              SizedBox(
                height: context.responsiveSpacing(
                  mobile: 30.0,
                  tablet: 35.0,
                  desktop: 40.0,
                  largeDesktop: 50.0,
                ),
              ),
              _buildStatsSection(context),
            ],
          ),
        ),
        SizedBox(
          width: context.responsiveSpacing(
            mobile: 20.0,
            tablet: 30.0,
            desktop: 40.0,
            largeDesktop: 80.0,
          ),
        ),
        // Right side - Profile image
        Expanded(flex: 2, child: _buildProfileImage(context)),
      ],
    );
  }

  Widget _buildIntroText(BuildContext context) {
    return Column(
      crossAxisAlignment:
          context.isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
      children: [
        Text(
          "Hi I am",
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
            fontSize: context.responsiveFontSize(
              mobile: 16.0,
              tablet: 18.0,
              desktop: 20.0,
              largeDesktop: 24.0,
            ),
            color: const Color(0xFF959595),
          ),
        ),
        SizedBox(
          height: context.responsiveSpacing(
            mobile: 8.0,
            tablet: 10.0,
            desktop: 12.0,
          ),
        ),
        Text(
          "Ashish Kumar",
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
            fontSize: context.responsiveFontSize(
              mobile: 22.0,
              tablet: 26.0,
              desktop: 32.0,
              largeDesktop: 36.0,
            ),
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: context.responsiveSpacing(
            mobile: 12.0,
            tablet: 14.0,
            desktop: 16.0,
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFFA6E00), // orange
                Color(0xFFE60026), // red
              ],
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
          },
          child: Text(
            "Flutter Developer",
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              fontSize: context.responsiveFontSize(
                mobile: 28.0,
                tablet: 36.0,
                desktop: 48.0,
                largeDesktop: 56.0,
              ),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcons(BuildContext context) {
    if (context.isMobile) return const SizedBox.shrink();

    return Row(
      children: [
        _buildSocialIcon(context, Icons.camera_alt, () {}), // Instagram
        SizedBox(
          width: context.responsiveSpacing(
            mobile: 12.0,
            tablet: 14.0,
            desktop: 16.0,
          ),
        ),
        _buildSocialIcon(context, Icons.work, () {}), // LinkedIn
        SizedBox(
          width: context.responsiveSpacing(
            mobile: 12.0,
            tablet: 14.0,
            desktop: 16.0,
          ),
        ),
        _buildSocialIcon(context, Icons.code, () {}), // GitHub
        SizedBox(
          width: context.responsiveSpacing(
            mobile: 12.0,
            tablet: 14.0,
            desktop: 16.0,
          ),
        ),
        _buildSocialIcon(context, Icons.sports_basketball, () {}), // Behance
      ],
    );
  }

  Widget _buildSocialIcon(
    BuildContext context,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.responsiveValue(
          mobile: 35.0,
          tablet: 38.0,
          desktop: 40.0,
          largeDesktop: 45.0,
        ),
        height: context.responsiveValue(
          mobile: 35.0,
          tablet: 38.0,
          desktop: 40.0,
          largeDesktop: 45.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF404040), width: 1),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF959595),
          size: context.responsiveValue(
            mobile: 18.0,
            tablet: 20.0,
            desktop: 20.0,
            largeDesktop: 24.0,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return context.responsiveWidget(
      mobile: Column(
        children: [
          _buildButton(
            context,
            "Hire Me",
            BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFFD6F00), // orange
                  Color(0xFFE46400), // red
                ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(
            height: context.responsiveSpacing(mobile: 16.0, tablet: 18.0),
          ),
          _buildButton(
            context,
            "Download CV",
            BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: const Color(0xFF404040), width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
      desktop: Row(
        mainAxisAlignment:
            context.isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
        children: [
          _buildButton(
            context,
            "Hire Me",
            BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFFD6F00), // orange
                  Color(0xFFE46400), // red
                ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(
            width: context.responsiveSpacing(
              mobile: 16.0,
              tablet: 18.0,
              desktop: 20.0,
            ),
          ),
          _buildButton(
            context,
            "Download CV",
            BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: const Color(0xFF404040), width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String buttonText,
    BoxDecoration boxdecoration, {
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: boxdecoration,
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600,
            fontSize: context.responsiveFontSize(
              mobile: 16.0,
              tablet: 16.0,
              desktop: 16.0,
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Container(
      width: context.responsiveValue(
        mobile: 250.0,
        tablet: 300.0,
        desktop: double.infinity,
        largeDesktop: double.infinity,
      ),
      height: context.responsiveValue(
        mobile: 300.0,
        tablet: 350.0,
        desktop: 450.0,
        largeDesktop: 500.0,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A2A2A), Color(0xFF1A1A1A)],
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.person,
              size: 100,
              color: Color(0xFF404040),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return context.responsiveWidget(
      mobile: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem(context, "5+", "Experiences"),
              _buildStatItem(context, "20+", "Project done"),
            ],
          ),
          SizedBox(
            height: context.responsiveSpacing(mobile: 20.0, tablet: 22.0),
          ),
          _buildStatItem(context, "80+", "Happy Clients"),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildStatItem(context, "5+", "Experiences"),
          SizedBox(
            width: context.responsiveSpacing(
              mobile: 30.0,
              tablet: 35.0,
              desktop: 40.0,
              largeDesktop: 60.0,
            ),
          ),
          _buildStatItem(context, "20+", "Project done"),
          SizedBox(
            width: context.responsiveSpacing(
              mobile: 30.0,
              tablet: 35.0,
              desktop: 40.0,
              largeDesktop: 60.0,
            ),
          ),
          _buildStatItem(context, "80+", "Happy Clients"),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String number, String label) {
    return Column(
      crossAxisAlignment:
          context.isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFFA6E00), // orange
                Color(0xFFE60026), // red
              ],
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
          },
          child: Text(
            number,
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              fontSize: context.responsiveFontSize(
                mobile: 32.0,
                tablet: 36.0,
                desktop: 40.0,
                largeDesktop: 48.0,
              ),
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: context.responsiveSpacing(
            mobile: 4.0,
            tablet: 6.0,
            desktop: 8.0,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
            fontSize: context.responsiveFontSize(
              mobile: 14.0,
              tablet: 16.0,
              desktop: 16.0,
              largeDesktop: 18.0,
            ),
            color: const Color(0xFF959595),
          ),
        ),
      ],
    );
  }
}
