import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle size32w500({Color? color}) => GoogleFonts.plusJakartaSans(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle size14w400({Color? color}) => GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color,
  );
  static TextStyle size24w600({Color? color}) => GoogleFonts.plusJakartaSans(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color,
  );
  static TextStyle size14w500({Color? color}) => GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle size16w500({Color? color}) => GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: color,
  );
  static TextStyle size16w600({Color? color}) => GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color,
  );
}

extension TextStyleExtension on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}
