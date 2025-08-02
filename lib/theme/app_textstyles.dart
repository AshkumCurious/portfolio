import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle buttonTextStyle({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.white, // Provide a default color
    );
  }

  static TextStyle textFieldTextStyle({Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.white, // Provide a default color
    );
  }

  static TextStyle textFieldErrorTextStyle = const TextStyle(
    color: Color(0xffFF0000),
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle hintTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.hintTextColor,
  );

  static TextStyle lableTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.lableColor,
  );

  static TextStyle headingTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryTextColor,
  );

  static TextStyle tabTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.tabTextColor,
  );

  static TextStyle tabTextStyle2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.tabTextColor2,
  );

  static TextStyle homeListingTitleTextStyle3 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.homeListingTitleColor,
  );

  static TextStyle homeCardTitleTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
    color: AppColors.primaryTextColor,
  );

  static TextStyle homeCardSubTitleTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.2,
    color: AppColors.homeCardSecondaryColor,
  );

  static TextStyle homeCardDateTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.2,
    color: AppColors.homeCardDateColor,
  );

  static TextStyle homeUpdateWidgetTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle homeUpdateWidgetSubTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
    color: AppColors.primaryColor,
  );

  static TextStyle detailsScreenHeaderTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.0,
    color: AppColors.detailsScreenHeaderColor,
  );

  static TextStyle detailsScreenTextComponentKeyTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
    color: AppColors.borderColor,
  );

  static TextStyle detailsScreenTextComponentValueTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.0,
    color: AppColors.detailsScreenValueColor,
  );

  static TextStyle assignCaptainDialogHeading = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle assignCaptainNameTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle cancelButtonTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
}
