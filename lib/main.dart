import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: PortfolioHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeroSection(),
            _buildAboutSection(),
            _buildProjectsSection(),
            _buildContactSection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      title: Text(
        'Portfolio',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black87),
      actions:
          MediaQuery.of(context).size.width > 768
              ? [
                _buildNavButton('Home', () => _scrollToSection(_homeKey)),
                _buildNavButton('About', () => _scrollToSection(_aboutKey)),
                _buildNavButton(
                  'Projects',
                  () => _scrollToSection(_projectsKey),
                ),
                _buildNavButton('Contact', () => _scrollToSection(_contactKey)),
                SizedBox(width: 20),
              ]
              : null,
    );
  }

  Widget _buildNavButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade600, Colors.blue.shade400],
              ),
            ),
            child: Text(
              'Navigation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildDrawerItem(
            'Home',
            Icons.home,
            () => _scrollToSection(_homeKey),
          ),
          _buildDrawerItem(
            'About',
            Icons.person,
            () => _scrollToSection(_aboutKey),
          ),
          _buildDrawerItem(
            'Projects',
            Icons.work,
            () => _scrollToSection(_projectsKey),
          ),
          _buildDrawerItem(
            'Contact',
            Icons.contact_mail,
            () => _scrollToSection(_contactKey),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue.shade600),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }

  Widget _buildHeroSection() {
    return Container(
      key: _homeKey,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade600,
            Colors.blue.shade400,
            Colors.cyan.shade300,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 100, color: Colors.blue.shade600),
            ),
            SizedBox(height: 30),
            Text(
              'Your Name',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Flutter Developer & Mobile App Specialist',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _scrollToSection(_projectsKey),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue.shade600,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'View My Work',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      key: _aboutKey,
      width: double.infinity,
      padding: EdgeInsets.all(40),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isDesktop = constraints.maxWidth > 768;
              return isDesktop
                  ? Row(
                    children: [
                      Expanded(child: _buildAboutText()),
                      SizedBox(width: 40),
                      Expanded(child: _buildSkills()),
                    ],
                  )
                  : Column(
                    children: [
                      _buildAboutText(),
                      SizedBox(height: 30),
                      _buildSkills(),
                    ],
                  );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello! I\'m a passionate Flutter developer with experience in creating beautiful, responsive mobile and web applications.',
          style: TextStyle(fontSize: 18, color: Colors.black87, height: 1.6),
        ),
        SizedBox(height: 20),
        Text(
          'I love turning ideas into reality through code and creating user experiences that are both functional and delightful.',
          style: TextStyle(fontSize: 18, color: Colors.black87, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildSkills() {
    final skills = [
      'Flutter & Dart',
      'Mobile Development',
      'Web Development',
      'Firebase',
      'REST APIs',
      'Git & GitHub',
      'UI/UX Design',
      'State Management',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills & Technologies',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills.map((skill) => _buildSkillChip(skill)).toList(),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.shade300),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Colors.blue.shade800,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Container(
      key: _projectsKey,
      width: double.infinity,
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            'My Projects',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount =
                  constraints.maxWidth > 1200
                      ? 3
                      : constraints.maxWidth > 768
                      ? 2
                      : 1;
              return GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.8,
                children: [
                  _buildProjectCard(
                    'E-Commerce App',
                    'A full-featured shopping app with cart, payments, and user authentication.',
                    Icons.shopping_cart,
                    Colors.green,
                  ),
                  _buildProjectCard(
                    'Weather App',
                    'Beautiful weather app with location-based forecasts and animations.',
                    Icons.cloud,
                    Colors.blue,
                  ),
                  _buildProjectCard(
                    'Task Manager',
                    'Productivity app with task scheduling, reminders, and team collaboration.',
                    Icons.task_alt,
                    Colors.orange,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: color),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add project link functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('View Project'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      key: _contactKey,
      width: double.infinity,
      padding: EdgeInsets.all(40),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'I\'m always open to discussing new opportunities and interesting projects.',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isDesktop = constraints.maxWidth > 768;
              return isDesktop
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildContactButton('Email', Icons.email, Colors.red),
                      SizedBox(width: 20),
                      _buildContactButton(
                        'LinkedIn',
                        Icons.business,
                        Colors.blue,
                      ),
                      SizedBox(width: 20),
                      _buildContactButton('GitHub', Icons.code, Colors.black),
                    ],
                  )
                  : Column(
                    children: [
                      _buildContactButton('Email', Icons.email, Colors.red),
                      SizedBox(height: 10),
                      _buildContactButton(
                        'LinkedIn',
                        Icons.business,
                        Colors.blue,
                      ),
                      SizedBox(height: 10),
                      _buildContactButton('GitHub', Icons.code, Colors.black),
                    ],
                  );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(String label, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {
        // Add contact functionality
      },
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: Colors.black87,
      child: Text(
        '© 2024 Your Name. All rights reserved.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
