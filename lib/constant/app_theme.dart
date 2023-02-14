import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class

  static const Map<int, Color> green = <int, Color>{
    50: Color(0xFFf2f8ef),
    100: Color(0xFFdfedd8),
    200: Color(0xFFc9e2be),
    300: Color(0xFFb3d6a4),
    400: Color(0xFFa3cd91),
    500: Color(0xFF93c47d),
    600: Color(0xFF8bbe75),
    700: Color(0xFF80b66a),
    800: Color(0xFF76af60),
    900: Color(0xFF64a24d)
  };
}

TextStyle primaryTextStyle = GoogleFonts.poppins(color: midnightBlue);
TextStyle blackTextStyle = GoogleFonts.poppins(color: blackColor);

TextStyle secondTextStyle = GoogleFonts.poppins(color: greyColor);
TextStyle greyTextStyle = GoogleFonts.poppins(color: greyColor);
TextStyle whiteTextStyle = GoogleFonts.poppins(color: whiteColor);

void changeTheme({bool isDark = true}) {
  SystemChrome.setSystemUIOverlayStyle(
    isDark
        ? SystemUiOverlayStyle(
            statusBarColor: midnightBlue,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: midnightBlue,
          )
        : SystemUiOverlayStyle(
            statusBarColor: whiteColor,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
  );
}
