

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AqsahaColors {
  static const secondary = Color.fromARGB(255, 94, 230, 180);
  static const accent = Color.fromARGB(255, 91, 214, 167);
  static const textDark = Color(0xFF53585A);
  static const textLight = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C4);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighLight = Color.fromARGB(255, 105, 212, 170);
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF393334);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AqsahaColors.cardLight; 
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AqsahaColors.cardDark;
}

/// Reference to The application Theme
class AqsahaTheme {
  static const accentColor = AqsahaColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;
  
  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();

  /// light theme and its settings.
  ThemeData get light => ThemeData(
    primaryColor: Colors.teal,
    brightness: Brightness.light,
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
      )
    ),
    colorScheme: lightBase.colorScheme.copyWith(secondary: accentColor),
    visualDensity: visualDensity,
    textTheme: GoogleFonts.mulishTextTheme().apply(
      bodyColor: AqsahaColors.textDark),
      backgroundColor: _LightColors.background,
      appBarTheme: lightBase.appBarTheme.copyWith(
        iconTheme: lightBase.iconTheme,
        backgroundColor: _LightColors.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: AqsahaColors.textDark,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      scaffoldBackgroundColor: _LightColors.background,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AqsahaColors.secondary,
        ),
      ),
      cardColor: _LightColors.card,
      primaryTextTheme: const TextTheme(
        headline6: TextStyle(
          color: AqsahaColors.textDark,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AqsahaColors.iconDark),
  );

  /// Dark Theme and its Settings.
  /// 
  ThemeData get dark => ThemeData(
    primaryColor: Colors.teal,
    brightness: Brightness.dark,
    colorScheme: darkBase.colorScheme.copyWith(secondary: accentColor),
    visualDensity: visualDensity,
    textTheme: GoogleFonts.mulishTextTheme().apply(
      bodyColor: AqsahaColors.textLight),
      backgroundColor: _DarkColors.background,
      appBarTheme: darkBase.appBarTheme.copyWith(
        iconTheme: darkBase.iconTheme,
        backgroundColor: _DarkColors.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      scaffoldBackgroundColor: _DarkColors.background,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AqsahaColors.secondary,
        ),
      ),
      cardColor: _DarkColors.card,
      primaryTextTheme: const TextTheme(
        headline6: TextStyle(
          color: AqsahaColors.textLight,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AqsahaColors.iconLight),
  );
}