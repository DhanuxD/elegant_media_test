import 'package:flutter/material.dart';

class ResponsiveHelper {

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }


  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }


  static bool isMobile(BuildContext context) {
    return screenWidth(context) < 600;
  }


  static bool isTablet(BuildContext context) {
    final width = screenWidth(context);
    return width >= 600 && width < 1024;
  }


  static bool isDesktop(BuildContext context) {
    return screenWidth(context) >= 1024;
  }


  static double maxContentWidth(BuildContext context) {

    final width = screenWidth(context);

    if (width >= 1024) {
      return 760;
    }

    if (width >= 600) {
      return 620;
    }

    return width;
  }


  static EdgeInsets screenPadding(BuildContext context) {

    final width = screenWidth(context);

    if (width >= 1024) {

      return const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 20,
      );

    } else if (width >= 600) {

      return const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 18,
      );

    } else {

      return const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      );
    }
  }


  static double responsiveFont(
      BuildContext context,
      double mobile,
      double tablet,
      double desktop,
      ) {

    if (isDesktop(context)) {
      return desktop;
    }

    if (isTablet(context)) {
      return tablet;
    }

    return mobile;
  }
}