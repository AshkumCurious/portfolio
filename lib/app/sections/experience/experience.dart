import 'package:flutter/material.dart';
import 'package:mysite/app/sections/experience/experience_desktop.dart';
import 'package:mysite/app/sections/experience/experience_mobile.dart';
import 'package:mysite/core/res/responsive.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: ExperienceMobile(),
        tablet: ExperienceMobile(),
        desktop: ExperienceDesktop());
  }
}
