import 'package:flutter/material.dart';

ThemeData getApplicationThemeData() {
  return ThemeData(
    primaryColor: HexColor.fromHex("#ED9728"),
    primaryColorLight: HexColor.fromHex("#B3ED9728"),
    primaryColorDark: HexColor.fromHex("#d17d11"),
    disabledColor: HexColor.fromHex("#707070"),
    useMaterial3: true,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: HexColor.fromHex("#ED9728"),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: HexColor.fromHex("#ED9728"),
      elevation: 4,
      shadowColor: HexColor.fromHex("#B3ED9728"),
      titleTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: HexColor.fromHex("#ED9728"),
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(8),
      hintStyle: TextStyle(
        fontSize: 12,
        color: HexColor.fromHex("#707070"),
        fontWeight: FontWeight.normal,
      ),
      labelStyle: TextStyle(
        fontSize: 12,
        color: HexColor.fromHex("#525252"),
        fontWeight: FontWeight.normal,
      ),
      errorStyle: TextStyle(
        fontSize: 12,
        color: HexColor.fromHex("#e61f34"),
        fontWeight: FontWeight.normal,
      ),

      //Focus border
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: HexColor.fromHex("#ED9728"), width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      // error border
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: HexColor.fromHex("#e61f34"), width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: HexColor.fromHex("#ED9728"), width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      // enabled border
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: HexColor.fromHex("#737477"), width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
    ),
  );
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
