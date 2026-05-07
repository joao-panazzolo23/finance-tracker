import 'package:flutter/material.dart';
import '../colors/dark-mode.dart';


ThemeData appTheme() {
  const primary = DarkMode.primary;
  return ThemeData(
    colorSchemeSeed: primary,
    inputDecorationTheme: inputDecorationTheme(primary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _elevatedButtonStyle(primary),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _outlinedButtonStyle(primary),
    ),
    textButtonTheme: TextButtonThemeData(
      style: _textButtonStyle(primary),
    ),
  );
}

///todo: remove all colors and set it to dark/white themes
InputDecorationTheme inputDecorationTheme(Color primary) {
  return InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade100,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: _border(Colors.grey.shade300),
    enabledBorder: _border(Colors.grey.shade300),
    focusedBorder: _border(primary, width: 2),
    errorBorder: _border(Colors.redAccent),
    focusedErrorBorder: _border(Colors.redAccent, width: 2),
    labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
    floatingLabelStyle: TextStyle(color: primary, fontSize: 13),
    errorStyle: const TextStyle(fontSize: 12),
  );
}

ButtonStyle _textButtonStyle(Color primary) {
  return ButtonStyle(
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.grey;
      }
      return primary;
    }),
    textStyle: WidgetStateProperty.all(
      const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

ButtonStyle _outlinedButtonStyle(Color primary) {
  return ButtonStyle(
    foregroundColor: WidgetStateProperty.all(primary),
    side: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return BorderSide(color: Colors.grey.shade300);
      }
      return BorderSide(color: primary);
    }),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    textStyle: WidgetStateProperty.all(
      const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

ButtonStyle _elevatedButtonStyle(Color primary) {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.grey.shade300;
      }
      if (states.contains(WidgetState.pressed)) {
        return primary.withValues(alpha: 0.8);
      }
      return primary;
    }),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    textStyle: WidgetStateProperty.all(
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
    elevation: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) return 2;
      return 4;
    }),
  );
}

OutlineInputBorder _border(Color color, {double width = 1}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );
