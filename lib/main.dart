import 'package:flutter/material.dart';

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
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter',
      ),
      home: PortfolioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
