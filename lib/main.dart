import 'package:flutter/material.dart';
import 'package:portfolio_website/theme/app_color_theme.dart';

import 'screens/portfolio_screen.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ashish Kumar - Flutter Developer',
      navigatorKey: navigatorKey,
      theme: orangeDarkTheme,
      home: PortfolioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
