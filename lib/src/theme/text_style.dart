part of '../../../ds.dart';

abstract class DSTextStyle {
  static const _baseTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'vSFProText',
    color: DSCoreColors.black,
    package: DSStrings.flutterPackageName,
  );

  static final TextStyle titleLarge = _baseTextStyle.copyWith(
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle titleMedium = _baseTextStyle.copyWith(
    fontSize: 24,
    height: 1.33,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 20,
    height: 1.4,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    height: 1.56,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodySmall = _baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle labelLargePromient = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle labelMediumPromient = TextStyle(
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle labelSmallPromient = TextStyle(
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle labelVerySmall = TextStyle(
    fontSize: 10,
    height: 1.6,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle labelVerySmallPromient = TextStyle(
    fontSize: 10,
    height: 1.6,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle captionVeryLarge = TextStyle(
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle captionLarge = TextStyle(
    fontSize: 13,
    height: 1.38,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle captionMedium = TextStyle(
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle captionSmall = TextStyle(
    fontSize: 11,
    height: 1.45,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle captionVerySmall = TextStyle(
    fontSize: 10,
    height: 1.6,
    fontWeight: FontWeight.w400,
  );
}

abstract class DSTextStyleFS {
  /// FS
  static const _baseTextStyleFSBeauSansPro = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'vFSBeauSansPro',
    color: DSCoreColors.black,
    package: DSStrings.flutterPackageName,
  );


  static final TextStyle fsHeadlineLarge = _baseTextStyleFSBeauSansPro.copyWith(
    fontSize: 18,
    height: 1.33,
    fontWeight: FontWeight.w600,
  );

  /// Display 1 Text Style
  static final TextStyle fsButtonS = _baseTextStyleFSBeauSansPro.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.33,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );
  static final TextStyle fsButtonM = _baseTextStyleFSBeauSansPro.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.43,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );
  static final TextStyle fsButtonL = _baseTextStyleFSBeauSansPro.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.5,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.none,
  );
}

abstract class BaseFontWeight {
  /// FontWeight value of `w900`
  static const FontWeight black = FontWeight.w900;

  /// FontWeight value of `w800`
  static const FontWeight extraBold = FontWeight.w800;

  /// FontWeight value of `w700`
  static const FontWeight bold = FontWeight.w700;

  /// FontWeight value of `w600`
  static const FontWeight semiBold = FontWeight.w600;

  /// FontWeight value of `w500`
  static const FontWeight medium = FontWeight.w500;

  /// FontWeight value of `w400`
  static const FontWeight regular = FontWeight.w400;

  /// FontWeight value of `w300`
  static const FontWeight light = FontWeight.w300;

  /// FontWeight value of `w200`
  static const FontWeight extraLight = FontWeight.w200;

  /// FontWeight value of `w100`
  static const FontWeight thin = FontWeight.w100;
}

extension AppTextStyle on TextStyle {
  TextStyle black() {
    return copyWith(
      fontWeight: BaseFontWeight.black,
    );
  }

  TextStyle extraBold() {
    return copyWith(
      fontWeight: BaseFontWeight.extraBold,
    );
  }

  TextStyle bold() {
    return copyWith(
      fontWeight: BaseFontWeight.bold,
    );
  }

  TextStyle semiBold() {
    return copyWith(
      fontWeight: BaseFontWeight.semiBold,
    );
  }

  TextStyle medium() {
    return copyWith(
      fontWeight: BaseFontWeight.medium,
    );
  }

  TextStyle regular() {
    return copyWith(
      fontWeight: BaseFontWeight.regular,
    );
  }

  TextStyle light() {
    return copyWith(
      fontWeight: BaseFontWeight.light,
    );
  }

  TextStyle extraLight() {
    return copyWith(
      fontWeight: BaseFontWeight.extraLight,
    );
  }

  TextStyle thin() {
    return copyWith(
      fontWeight: BaseFontWeight.thin,
    );
  }

  TextStyle applyColor(Color color) {
    return copyWith(color: color);
  }
}
