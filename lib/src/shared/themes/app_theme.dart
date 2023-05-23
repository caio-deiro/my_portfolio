import 'package:app_miscelanea/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  ThemeData themeDark = ThemeData(
    primaryColor: primaryDark,
    highlightColor: highlightDark,
    cardColor: cardDark,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.amber,
    ),
    scaffoldBackgroundColor: backgroundDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundDark,
    ),
    textTheme: TextTheme(
      /// title Theme
      displayLarge: TextStyle(
        fontFamily: 'poppins',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: highlightDark,
      ),

      /// subtitle theme
      displayMedium: TextStyle(
        fontFamily: 'poppins',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: highlightDark,
      ),

      /// text body theme
      bodyLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: descriptionDark,
      ),

      /// small text body theme
      bodyMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: highlightDark,
      ),
    ),
  );

  ThemeData themeLight = ThemeData(
    scaffoldBackgroundColor: backgroundLight,
    primaryColor: primaryLight,
    highlightColor: highLight,
    cardColor: cardLight,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.amber,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.brown,
    ),
    textTheme: TextTheme(
      /// title Theme
      displayLarge: TextStyle(
        fontFamily: 'poppins',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: highLight,
      ),

      /// subtitle theme
      displayMedium: TextStyle(
        fontFamily: 'poppins',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: highLight,
      ),

      /// text body theme
      bodyLarge: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: descriptionLight,
      ),

      /// small text body theme
      bodyMedium: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: highLight,
      ),
    ),
  );
}
