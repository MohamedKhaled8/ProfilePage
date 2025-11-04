import 'package:flutter/material.dart';
import 'package:my_website/core/utils/constants/app_size.dart';
import 'package:my_website/core/utils/constants/my_colors.dart';

class AppTheme {
  final String fontFamily;
  AppTheme({required this.fontFamily});

   ThemeData get dark {
    return _getThemeData(
      colorScheme: ColorScheme.dark(
        primary: ColorsManger.primaryColor,
        background: ColorsManger.darkBackgroundCColor,
        onBackground: ColorsManger.gray100,
        surface: ColorsManger.gray[850]!,
        outline: ColorsManger.gray[800]!,
        outlineVariant: ColorsManger.gray[700]!,
        onSurface: ColorsManger.gray[300]!,
        onSurfaceVariant: ColorsManger.gray[400]!,
        tertiary: ColorsManger.gray[900]!,
      ),
      useMaterial3: true,
      elevatedButtonTextStyle: _darkElevatedButtonTextStyle(null),
      outlinedButtonTextStyle: _darkOutlinedButtonTextStyle(null),
      scaffoldBackgroundColor: ColorsManger.darkBackgroundCColor,
      appBarTheme: AppBarTheme(color: ColorsManger.gray900),
    );
  }

   ThemeData get light {
    return _getThemeData(
      colorScheme: ColorScheme.light(
        primary: ColorsManger.primaryColor,
        background: ColorsManger.gray100,
        onBackground: ColorsManger.gray900,
        surface: ColorsManger.gray[200]!,
        outline: ColorsManger.gray[300]!,
        outlineVariant: ColorsManger.gray[400]!,
        onSurface: ColorsManger.gray[700]!,
        onSurfaceVariant: ColorsManger.gray[600]!,
        tertiary: ColorsManger.gray[900]!,
      ),
      elevatedButtonTextStyle: _lightElevatedButtonTextStyle(null),
      outlinedButtonTextStyle: _lightOutlinedButtonTextStyle(null),
      useMaterial3: true,
      scaffoldBackgroundColor: ColorsManger.gray100,
      appBarTheme: AppBarTheme(color: ColorsManger.gray100),
    );
  }

  static ThemeData _getThemeData({
    required ColorScheme colorScheme,
    bool useMaterial3 = true,
    String? fontFamily,
    required Color scaffoldBackgroundColor,
    required AppBarTheme appBarTheme,
    MaterialStateProperty<TextStyle?>? elevatedButtonTextStyle,
    MaterialStateProperty<TextStyle?>? outlinedButtonTextStyle,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: useMaterial3,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: appBarTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const MaterialStatePropertyAll(Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.xs, vertical: 10.0),
          ), // EdgeInsets.symmetric // MaterialStatePropertyAll
          textStyle: elevatedButtonTextStyle,
        ), // ButtonStyle
      ), // ElevatedButtonThemeData
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const MaterialStatePropertyAll(Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.xs, vertical: 10.0),
          ), // EdgeInsets.symmetric // MaterialStatePropertyAll
          textStyle: outlinedButtonTextStyle,
        ), // ButtonStyle
      ), // OutlinedButtonThemeData
    );
  }

  static final MaterialStateProperty<Color?> _primaryButtonStates =
      MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered) ||
            states.contains(MaterialState.pressed)) {
          return const Color(0xff561895).withOpacity(0.7);
        }
        return ColorsManger.primaryColor;
      });

  static MaterialStateProperty<TextStyle?> _darkElevatedButtonTextStyle(
    String? fontFamily,
  ) => MaterialStatePropertyAll(
    TextStyle(
      color: ColorsManger.gray[100],
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    ),
  );

  static MaterialStateProperty<TextStyle?> _lightElevatedButtonTextStyle(
    String? fontFamily,
  ) => MaterialStatePropertyAll(
    TextStyle(
      color: ColorsManger.gray[100],
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    ),
  );

  static MaterialStateProperty<TextStyle?> _darkOutlinedButtonTextStyle(
    String? fontFamily,
  ) => MaterialStatePropertyAll(
    TextStyle(
      color: ColorsManger.gray[100],
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    ),
  );

  static MaterialStateProperty<TextStyle?> _lightOutlinedButtonTextStyle(
    String? fontFamily,
  ) => MaterialStatePropertyAll(
    TextStyle(
      color: ColorsManger.gray[100],
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    ),
  );
}
