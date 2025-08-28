import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:truck/theme/text_styles.dart';

import 'colors.dart';

class AppThemeData {
  static ThemeData themeData({
    String? fontFamily,
    bool lightTheme = true,
  }) {
    return ThemeData(
     //appBarTheme: AppBarTheme(
     //  systemOverlayStyle: SystemUiOverlayStyle(
     //    statusBarColor: AppLightColors().scaffoldBackgroundColor,
     //    statusBarBrightness: lightTheme ? Brightness.dark : Brightness.light,
     //    statusBarIconBrightness:
     //        lightTheme ? Brightness.dark : Brightness.light,
     //  ),
     //),
      textTheme: AppTextTheme().myTextTheme(
          fontFamily: fontFamily,
          colors: lightTheme ? AppLightColors() : AppDarkColors()),
      primaryColor:
          lightTheme ? AppLightColors().primary : AppDarkColors().primary,
      scaffoldBackgroundColor: lightTheme
          ? AppLightColors().scaffoldBackgroundColor
          : AppDarkColors().scaffoldBackgroundColor,
      colorScheme: Methods.colorScheme(
          colors: lightTheme ? AppLightColors() : AppDarkColors(),
          lightTheme: lightTheme),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppDarkColors().primary,
          selectionHandleColor: AppDarkColors().primary,
          selectionColor: AppDarkColors().primary),
      /* inputDecorationTheme: Methods.inputDecorationTheme(
          colors: lightTheme ? AppLightColors() : AppDarkColors()),
      elevatedButtonTheme: Methods.elevatedButtonTheme(
          colors: lightTheme ? AppLightColors() : AppDarkColors()),
      textButtonTheme: Methods.textButtonTheme(
          colors: lightTheme ? AppLightColors() : AppDarkColors()),
      outlinedButtonTheme: Methods.outlinedButtonTheme(
          colors: lightTheme ? AppLightColors() : AppDarkColors()),*/
    );
  }
}

class Methods {
  static ColorScheme colorScheme({dynamic colors, bool lightTheme = true}) {
    return ColorScheme(
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.secondary,
      onSecondary: colors.onSecondary,
      error: colors.error,
      brightness: lightTheme ? Brightness.light : Brightness.dark,
      onError: colors.success,
      surface: colors.caption,
      onSurface: colors.captionHint,
      onSecondaryContainer: colors.captionLight,
    );
  }

  static InputDecorationTheme inputDecorationTheme({dynamic colors}) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.only(top: 1),
      constraints: BoxConstraints(maxHeight: 70.px),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 1, color: colors.onPrimary),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 1, color: colors.primary),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: colors.error),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: colors.error),
      ),
    );
  }

  static ElevatedButtonThemeData elevatedButtonTheme({dynamic colors}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.px),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
    );
  }

  static TextButtonThemeData textButtonTheme({dynamic colors}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.px),
        ),
        padding: EdgeInsets.zero,
        foregroundColor: colors.primary,
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme({dynamic colors}) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.px),
          ),
          foregroundColor: colors.text,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.all(3.5.px),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
    );
  }
}
