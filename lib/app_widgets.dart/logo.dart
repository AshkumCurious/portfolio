import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/responsive_utils.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
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
        "AK",
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontFamily: 'K2D',
          fontWeight: FontWeight.w700,
          // Using responsive font size
          fontSize: context.responsiveFontSize(
            mobile: 24.0,
            tablet: 28.0,
            desktop: 32.0,
            largeDesktop: 36.0,
          ),
          height: 1.0,
          letterSpacing:
              0.03 *
              context.responsiveFontSize(
                mobile: 24.0,
                tablet: 28.0,
                desktop: 32.0,
                largeDesktop: 36.0,
              ),
          color: Colors.white,
        ),
      ),
    );
  }
}
