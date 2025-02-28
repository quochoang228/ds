part of '../../../ds.dart';

abstract class DSColors {
  static Color get backgroundWhite => DSCoreColors.white;

  static Color get backgroundBlack => DSCoreColors.black;

  static Color get backgroundBlack2 => DSCoreColors.neutral08;

  static Color get backgroundGray => DSCoreColors.neutral00;

  static Color get backgroundGray1 => DSCoreColors.neutral01;

  static Color get backgroundGray2 => DSCoreColors.neutral02;

  static Color get backgroundGray3 => DSCoreColors.neutral03;

  static Color get backgroundHover => DSCoreColors.neutral03;

  static Color get backgroundPressed => DSCoreColors.neutral04;

  static Color get backgroundDisable => DSCoreColors.neutral01;

  static Color get textTitle => DSCoreColors.black;

  static Color get textLabel => DSCoreColors.neutral10;

  static Color get textBody => DSCoreColors.neutral09;

  static Color get textSubtitle => DSCoreColors.neutral06;

  static Color get textPlaceholder => DSCoreColors.neutral04;

  static Color get textDisable => DSCoreColors.neutral03;

  static Color get textOnColor => DSCoreColors.white;

  static Color get borderDefault => DSCoreColors.neutral02;

  static Color get borderDefaultHover => DSCoreColors.neutral05;

  static Color get borderDivider => DSCoreColors.neutral01;

  static Color get borderDisable => DSCoreColors.neutral00;

  static Color get borderFocus => DSCoreColors.neutral10;

  static Color get primary => DSCoreColors.primary;

  static Color get primaryHover => DSCoreColors.primary05;

  static Color get primaryPressed => DSCoreColors.primary06;

  static Color get primarySurface => DSCoreColors.primary01;

  static Color get primarySurfaceHover => DSCoreColors.primary02;

  static Color get primarySurfacePressed => DSCoreColors.primary03;

  static Color get secondary => DSCoreColors.neutral05;

  static Color get secondaryBackground => DSCoreColors.neutral01;

  static Color get secondaryHover => DSCoreColors.neutral02;

  static Color get secondaryPressed => DSCoreColors.neutral03;

  static Color get secondaryBorder => DSCoreColors.neutral04;

  static Color get secondarySurface => DSCoreColors.neutral02;

  static Color get secondarySurfacePressed => DSCoreColors.neutral03;

  static Color get info => DSCoreColors.blue;

  static Color get infoHover => DSCoreColors.blue05;

  static Color get infoPressed => DSCoreColors.blue06;

  static Color get infoSurface => DSCoreColors.blue01;

  static Color get infoSurfaceHover => DSCoreColors.blue02;

  static Color get infoSurfacePressed => DSCoreColors.blue03;

  static Color get infoBorder => DSCoreColors.blue;

  static Color get success => DSCoreColors.green;

  static Color get successHover => DSCoreColors.green05;

  static Color get successPressed => DSCoreColors.green06;

  static Color get successSurface => DSCoreColors.green01;

  static Color get successSurfaceHover => DSCoreColors.green02;

  static Color get successSurfacePressed => DSCoreColors.green03;

  static Color get successGreenBorder => DSCoreColors.green;

  static Color get warning => DSCoreColors.orange;

  static Color get warningHover => DSCoreColors.orange05;

  static Color get warningPressed => DSCoreColors.orange06;

  static Color get warningSurface => DSCoreColors.orange01;

  static Color get warningSurfaceHover => DSCoreColors.orange02;

  static Color get warningSurfacePressed => DSCoreColors.orange03;

  static Color get warningOrangeBorder => DSCoreColors.orange;

  static Color get yellow => DSCoreColors.yellow05;

  static Color get yellowHover => DSCoreColors.yellow05;

  static Color get yellowPressed => DSCoreColors.yellow06;

  static Color get yellowSurface => DSCoreColors.yellow01;

  static Color get yellowSurfaceHover => DSCoreColors.yellow02;

  static Color get yellowSurfacePressed => DSCoreColors.yellow03;

  static Color get yellowBorder => DSCoreColors.yellow;

  static Color get error => DSCoreColors.red;

  static Color get errorHover => DSCoreColors.red05;

  static Color get errorPressed => DSCoreColors.red06;

  static Color get errorSurface => DSCoreColors.red01;

  static Color get errorSurfaceHover => DSCoreColors.red02;

  static Color get errorSurfacePressed => DSCoreColors.red03;

  static Color get errorBorder => DSCoreColors.red;

  static Color get primaryBorder => DSCoreColors.primary;

  static Color get required => DSCoreColors.red;

  static Color get errorSurfaceV2 => DSCoreColors.primary00;

  static Color get infoSurfaceV2 => DSCoreColors.blue00;
}

abstract class DSCoreColors {
  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xFF151515);
  static const Color neutral00 = Color(0xFFF4F4F4);
  static const Color neutral01 = Color(0xFFEAEAEA);
  static const Color neutral02 = Color(0xFFD4D4D4);
  static const Color neutral03 = Color(0xFFBFBFBF);
  static const Color neutral04 = Color(0xFFAAAAAA);
  static const Color neutral05 = Color(0xFF959595);
  static const Color neutral06 = Color(0xFF7F7F7F);
  static const Color neutral07 = Color(0xFF6A6A6A);
  static const Color neutral08 = Color(0xFF555555);
  static const Color neutral09 = Color(0xFF404040);
  static const Color neutral10 = Color(0xFF2A2A2A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFFEE0033);
  static const Color primary00 = Color(0xFFFFF1F0);
  static const Color primary01 = Color(0xFFFFD8E0);
  static const Color primary02 = Color(0xFFFFB1C2);
  static const Color primary03 = Color(0xFFFF8AA3);
  static const Color primary04 = Color(0xFFFF6485);
  static const Color primary05 = Color(0xFFFF3D66);
  static const Color primary06 = Color(0xFFFF1648);
  static const Color primary07 = Color(0xFFCB002B);
  static const Color primary08 = Color(0xFFA70024);
  static const Color primary09 = Color(0xFF84001C);
  static const Color primary10 = Color(0xFF600015);
  static const Color blue = Color(0xFF2D84FF);
  static const Color blue00 = Color(0xFFE9F2FF);
  static const Color blue01 = Color(0xFFD5E6FF);
  static const Color blue02 = Color(0xFFABCEFF);
  static const Color blue03 = Color(0xFF81B5FF);
  static const Color blue04 = Color(0xFF579DFF);
  static const Color blue05 = Color(0xFF0069FE);
  static const Color blue06 = Color(0xFF0056D0);
  static const Color blue07 = Color(0xFF0043A3);
  static const Color blue08 = Color(0xFF003075);
  static const Color green = Color(0xFF39B54A);
  static const Color green01 = Color(0xFFDDF4E0);
  static const Color green02 = Color(0xFFBAE9C1);
  static const Color green03 = Color(0xFF98DEA1);
  static const Color green04 = Color(0xFF75D482);
  static const Color green05 = Color(0xFF53C963);
  static const Color green06 = Color(0xFF2F953D);
  static const Color green07 = Color(0xFF257430);
  static const Color green08 = Color(0xFF1A5422);
  static const Color orange = Color(0xFFFF9100);
  static const Color orange01 = Color(0xFFFFEDD4);
  static const Color orange02 = Color(0xFFFFDAAA);
  static const Color orange03 = Color(0xFFFFC880);
  static const Color orange04 = Color(0xFFFFB655);
  static const Color orange05 = Color(0xFFFFA32B);
  static const Color orange06 = Color(0xFFD17700);
  static const Color orange07 = Color(0xFFA35D00);
  static const Color orange08 = Color(0xFF754300);
  static const Color error08 = Color(0xFF620F0D);
  static const Color red = Color(0xFFE53935);
  static const Color red01 = Color(0xFFFAD7D7);
  static const Color red02 = Color(0xFFF5B0AE);
  static const Color red03 = Color(0xFFEF8886);
  static const Color red04 = Color(0xFFEA615D);
  static const Color red05 = Color(0xFFD41F1B);
  static const Color red06 = Color(0xFFAE1A16);
  static const Color red07 = Color(0xFF881412);
  static const Color yellow = Color(0xFFFFD600);
  static const Color yellow01 = Color(0xFFFFF8D5);
  static const Color yellow02 = Color(0xFFFFF1AA);
  static const Color yellow03 = Color(0xFFFFEB7F);
  static const Color yellow04 = Color(0xFFFFE455);
  static const Color yellow05 = Color(0xFFFFDD2B);
  static const Color yellow06 = Color(0xFFD1AF00);
  static const Color yellow07 = Color(0xFFA38900);
  static const Color yellow08 = Color(0xFF756200);
  static const Color cultured = Color(0xFFF6F2F2);
  static const Color cultured1 = Color(0xFF979CA6);
  static const Color manatee = Color(0xFFF6E5DD);
  static const Color manatee1 = Color(0xFFD8A487);
  static const Color dutchWhite = Color(0xFFF5DFBC);
  static const Color dutchWhite1 = Color(0xFFFFB950);
  static const Color lavenderBlush = Color(0xFFF7E7F8);
  static const Color lavenderBlush1 = Color(0xFFF7E7F8);
  static const Color lavenderBlush2 = Color(0xFF91A2FC);
}
