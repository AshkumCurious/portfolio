import 'package:flutter/material.dart';

/// Global responsive utility class for handling different screen sizes
class ResponsiveUtils {
  // Breakpoints
  static const double mobileBreakpoint = 768.0;
  static const double tabletBreakpoint = 1024.0;
  static const double desktopBreakpoint = 1200.0;
  static const double largeDesktopBreakpoint = 1440.0;

  /// Get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Check if device is mobile (width < 768px)
  static bool isMobile(BuildContext context) {
    return getScreenWidth(context) < mobileBreakpoint;
  }

  /// Check if device is tablet (768px <= width < 1024px)
  static bool isTablet(BuildContext context) {
    double width = getScreenWidth(context);
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  /// Check if device is desktop (width >= 1024px)
  static bool isDesktop(BuildContext context) {
    return getScreenWidth(context) >= tabletBreakpoint;
  }

  /// Check if device is large desktop (width >= 1440px)
  static bool isLargeDesktop(BuildContext context) {
    return getScreenWidth(context) >= largeDesktopBreakpoint;
  }

  /// Check if device is mobile or tablet
  static bool isMobileOrTablet(BuildContext context) {
    return getScreenWidth(context) < tabletBreakpoint;
  }

  /// Get device type as enum
  static DeviceType getDeviceType(BuildContext context) {
    double width = getScreenWidth(context);

    if (width < mobileBreakpoint) return DeviceType.mobile;
    if (width < tabletBreakpoint) return DeviceType.tablet;
    if (width < largeDesktopBreakpoint) return DeviceType.desktop;
    return DeviceType.largeDesktop;
  }

  /// Responsive value based on device type
  /// Usage: ResponsiveUtils.getValue(context, mobile: 16, tablet: 18, desktop: 20)
  static T getValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    DeviceType deviceType = getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
      case DeviceType.largeDesktop:
        return largeDesktop ?? desktop ?? tablet ?? mobile;
    }
  }

  /// Get responsive padding
  static EdgeInsets getPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: getValue(
        context,
        mobile: 16.0,
        tablet: 24.0,
        desktop: 50.0,
        largeDesktop: 50.0,
      ),
      vertical: getValue(
        context,
        mobile: 16.0,
        tablet: 20.0,
        desktop: 24.0,
        largeDesktop: 30.0,
      ),
    );
  }

  /// Get responsive font size
  static double getFontSize(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
    double? largeDesktop,
  }) {
    return getValue(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
    );
  }

  /// Get responsive spacing
  static double getSpacing(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
    double? largeDesktop,
  }) {
    return getValue(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
    );
  }

  /// Get responsive width percentage
  static double getWidthPercent(BuildContext context, double percent) {
    return getScreenWidth(context) * (percent / 100);
  }

  /// Get responsive height percentage
  static double getHeightPercent(BuildContext context, double percent) {
    return getScreenHeight(context) * (percent / 100);
  }

  /// Get responsive columns count for grid
  static int getColumnsCount(BuildContext context) {
    return getValue(context, mobile: 1, tablet: 2, desktop: 3, largeDesktop: 4);
  }

  /// Execute different widgets based on screen size
  static Widget responsiveWidget(
    BuildContext context, {
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
    Widget? largeDesktop,
  }) {
    return getValue(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
    );
  }

  /// Get responsive border radius
  static BorderRadius getBorderRadius(BuildContext context) {
    return BorderRadius.circular(
      getValue(
        context,
        mobile: 8.0,
        tablet: 12.0,
        desktop: 16.0,
        largeDesktop: 20.0,
      ),
    );
  }

  /// Get responsive elevation
  static double getElevation(BuildContext context) {
    return getValue(
      context,
      mobile: 2.0,
      tablet: 4.0,
      desktop: 6.0,
      largeDesktop: 8.0,
    );
  }

  /// Custom responsive function - pass your own function
  static T custom<T>(
    BuildContext context,
    T Function(DeviceType deviceType, double width, double height) builder,
  ) {
    return builder(
      getDeviceType(context),
      getScreenWidth(context),
      getScreenHeight(context),
    );
  }
}

/// Device type enumeration
enum DeviceType { mobile, tablet, desktop, largeDesktop }

/// Extension on BuildContext for easier access to responsive functions
extension ResponsiveContext on BuildContext {
  bool get isMobile => ResponsiveUtils.isMobile(this);
  bool get isTablet => ResponsiveUtils.isTablet(this);
  bool get isDesktop => ResponsiveUtils.isDesktop(this);
  bool get isLargeDesktop => ResponsiveUtils.isLargeDesktop(this);
  bool get isMobileOrTablet => ResponsiveUtils.isMobileOrTablet(this);

  DeviceType get deviceType => ResponsiveUtils.getDeviceType(this);
  double get screenWidth => ResponsiveUtils.getScreenWidth(this);
  double get screenHeight => ResponsiveUtils.getScreenHeight(this);

  EdgeInsets get responsivePadding => ResponsiveUtils.getPadding(this);
  BorderRadius get responsiveBorderRadius =>
      ResponsiveUtils.getBorderRadius(this);
  double get responsiveElevation => ResponsiveUtils.getElevation(this);
  int get responsiveColumns => ResponsiveUtils.getColumnsCount(this);

  T responsiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) => ResponsiveUtils.getValue(
    this,
    mobile: mobile,
    tablet: tablet,
    desktop: desktop,
    largeDesktop: largeDesktop,
  );

  double responsiveFontSize({
    required double mobile,
    double? tablet,
    double? desktop,
    double? largeDesktop,
  }) => ResponsiveUtils.getFontSize(
    this,
    mobile: mobile,
    tablet: tablet,
    desktop: desktop,
    largeDesktop: largeDesktop,
  );

  double responsiveSpacing({
    required double mobile,
    double? tablet,
    double? desktop,
    double? largeDesktop,
  }) => ResponsiveUtils.getSpacing(
    this,
    mobile: mobile,
    tablet: tablet,
    desktop: desktop,
    largeDesktop: largeDesktop,
  );

  Widget responsiveWidget({
    required Widget mobile,
    Widget? tablet,
    Widget? desktop,
    Widget? largeDesktop,
  }) => ResponsiveUtils.responsiveWidget(
    this,
    mobile: mobile,
    tablet: tablet,
    desktop: desktop,
    largeDesktop: largeDesktop,
  );
}
