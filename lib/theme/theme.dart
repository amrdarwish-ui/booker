import 'package:booker/consts.dart';
import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
      colorScheme: const ColorScheme(
        primary: Color(0xff5ABD8C),
        primaryVariant: Color(0xff5ABD8C),
        onPrimary: Color(0xFF),
        secondary: Color(0xFFcdcdcd),
        secondaryVariant: Color(0xFFa2a3a4),
        onSecondary: Color(0xFF),
        surface: Colors.transparent,
        onSurface: Color(0xFF),
        background: Colors.transparent,
        onBackground: Color(0xFF),
        error: Color(0xFFea0000),
        onError: Color(0xFF),
        brightness: Brightness.light,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xffEFEFEF),
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red)),
      ));
}
