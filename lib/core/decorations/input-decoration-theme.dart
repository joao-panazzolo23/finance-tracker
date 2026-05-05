import 'package:flutter/material.dart';

ThemeData appTheme() {
  const primary = Color(0xFF6C63FF);

  return ThemeData(
    colorSchemeSeed: primary,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: _border(Colors.grey.shade300),
      enabledBorder: _border(Colors.grey.shade300),
      focusedBorder: _border(primary, width: 2),
      errorBorder: _border(Colors.redAccent),
      focusedErrorBorder: _border(Colors.redAccent, width: 2),
      labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
      floatingLabelStyle: const TextStyle(color: primary, fontSize: 13),
      errorStyle: const TextStyle(fontSize: 12),
    ),
  );
}

OutlineInputBorder _border(Color color, {double width = 1}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );