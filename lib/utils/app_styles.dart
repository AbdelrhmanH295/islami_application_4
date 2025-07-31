import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_application_4/utils/app_colors.dart';

class AppStyles {
  static TextStyle bold16white = GoogleFonts.elMessiri(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold20white = GoogleFonts.elMessiri(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold36white = GoogleFonts.elMessiri(
      fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold24black = GoogleFonts.elMessiri(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle bold14black = GoogleFonts.elMessiri(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.blackColor);
       static TextStyle bold20black = GoogleFonts.elMessiri(
      fontSize:20, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle bold20primary = GoogleFonts.elMessiri(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryColor);
  static TextStyle bold24primary = GoogleFonts.elMessiri(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryColor);
}
