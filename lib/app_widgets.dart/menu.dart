import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/responsive_utils.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String activeItem = "Home";

  void _setActiveItem(String item) {
    setState(() {
      activeItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Using the global responsive function
    return context.responsiveWidget(
      mobile: MobileMenu(
        activeItem: activeItem,
        onItemSelected: _setActiveItem,
      ),
      desktop: DesktopMenu(
        activeItem: activeItem,
        onItemSelected: _setActiveItem,
      ),
    );
  }
}

class DesktopMenu extends StatelessWidget {
  final String activeItem;
  final Function(String) onItemSelected;

  const DesktopMenu({
    super.key,
    required this.activeItem,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Using responsive spacing
    double horizontalPadding = context.responsiveSpacing(
      mobile: 15.0,
      tablet: 20.0,
      desktop: 25.0,
      largeDesktop: 30.0,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenuItem(
          text: "Home",
          isActive: activeItem == "Home",
          horizontalPadding: horizontalPadding,
          onTap: () => onItemSelected("Home"),
        ),
        MenuItem(
          text: "Experience",
          isActive: activeItem == "Experience",
          horizontalPadding: horizontalPadding,
          onTap: () => onItemSelected("Experience"),
        ),
        MenuItem(
          text: "Projects",
          isActive: activeItem == "Projects",
          horizontalPadding: horizontalPadding,
          onTap: () => onItemSelected("Projects"),
        ),
        MenuItem(
          text: "About me",
          isActive: activeItem == "About me",
          horizontalPadding: horizontalPadding,
          onTap: () => onItemSelected("About me"),
        ),
        MenuItem(
          text: "Contact me",
          isActive: activeItem == "Contact me",
          horizontalPadding: horizontalPadding,
          onTap: () => onItemSelected("Contact me"),
        ),
      ],
    );
  }
}

class MobileMenu extends StatefulWidget {
  final String activeItem;
  final Function(String) onItemSelected;

  const MobileMenu({
    super.key,
    required this.activeItem,
    required this.onItemSelected,
  });

  @override
  State<MobileMenu> createState() => _MobileMenuState();
}

class _MobileMenuState extends State<MobileMenu>
    with SingleTickerProviderStateMixin {
  bool isMenuOpen = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });

    if (isMenuOpen) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _selectItem(String item) {
    widget.onItemSelected(item);
    _toggleMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Hamburger Icon
        GestureDetector(
          onTap: _toggleMenu,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animation,
              color: const Color(0xFFFD6F00),
              // Using responsive sizing
              size: context.responsiveValue(mobile: 24.0, tablet: 28.0),
            ),
          ),
        ),
        // Dropdown Menu
        if (isMenuOpen)
          Positioned(
            top: context.responsiveValue(mobile: 45.0, tablet: 50.0),
            right: 0,
            child: FadeTransition(
              opacity: _animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -0.5),
                  end: Offset.zero,
                ).animate(_animation),
                child: Container(
                  width: context.responsiveValue(mobile: 180.0, tablet: 200.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: context.responsiveBorderRadius,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: context.responsiveElevation,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildMobileMenuItem("Home"),
                      _buildMobileMenuItem("Experience"),
                      _buildMobileMenuItem("Projects"),
                      _buildMobileMenuItem("About me"),
                      _buildMobileMenuItem("Contact me"),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMobileMenuItem(String text) {
    bool isActive = widget.activeItem == text;
    return GestureDetector(
      onTap: () => _selectItem(text),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: context.responsiveSpacing(mobile: 14.0, tablet: 16.0),
          horizontal: context.responsiveSpacing(mobile: 16.0, tablet: 20.0),
        ),
        decoration: BoxDecoration(
          color:
              isActive
                  ? const Color(0xFFFF6F00).withOpacity(0.1)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            fontSize: context.responsiveFontSize(mobile: 14.0, tablet: 16.0),
            color: isActive ? const Color(0xFFFF6F00) : const Color(0xFF959595),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.text,
    required this.isActive,
    this.horizontalPadding = 30.0,
    this.onTap,
  });

  final String text;
  final bool isActive;
  final double horizontalPadding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              // Using responsive font size
              fontSize: context.responsiveFontSize(
                mobile: 16.0,
                tablet: 18.0,
                desktop: 20.0,
              ),
              height: 1.0,
              letterSpacing:
                  0.03 *
                  context.responsiveFontSize(
                    mobile: 16.0,
                    tablet: 18.0,
                    desktop: 20.0,
                  ),
              color:
                  isActive ? const Color(0xFFFF6F00) : const Color(0xFF959595),
            ),
          ),
        ),
      ),
    );
  }
}
