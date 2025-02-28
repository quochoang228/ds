part of '../../../ds.dart';

class DsTitle extends StatelessWidget {
  final String title;
  final DsTitleType type;
  final TextStyle? customStyle;
  final Color? color;
  final FontWeight? fontWeight;
  final Widget? icon;
  final TextDirection? textDirection;

  const DsTitle({
    super.key,
    required this.title,
    this.type = DsTitleType.normal,
    this.customStyle,
    this.color,
    this.fontWeight,
    this.icon,
    this.textDirection,
  });

  const DsTitle.header({
    super.key,
    required this.title,
    this.type = DsTitleType.header,
    this.customStyle,
    this.color,
    this.fontWeight,
    this.icon,
    this.textDirection,

  });


  /// Body text
  /// Text style: DSTextStyle.bodySmall
  /// _baseTextStyle.copyWith(
  ///     fontSize: 14,
  ///    height: 1.43,
  ///   fontWeight: FontWeight.w400,
  ///)
  const DsTitle.body({
    super.key,
    required this.title,
    this.type = DsTitleType.body,
    this.customStyle,
    this.color,
    this.fontWeight,
    this.icon,
    this.textDirection,

  });


  const DsTitle.caption({
    super.key,
    required this.title,
    this.type = DsTitleType.caption,
    this.customStyle,
    this.color,
    this.fontWeight,
    this.icon,
    this.textDirection,

  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;

    switch (type) {
      case DsTitleType.normal:
        textStyle = DSTextStyle.bodySmall;
        break;
      case DsTitleType.header:
        textStyle = DSTextStyle.headlineMedium;
        break;
      case DsTitleType.body:
        textStyle = DSTextStyle.bodySmall;
        break;

      case DsTitleType.caption:
        textStyle = DSTextStyle.captionMedium;
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: textDirection,
      children: [
        Text(
          title,
          style: (customStyle ?? textStyle).copyWith(
            color: color,
            fontWeight: fontWeight,
          ),
        ),
        const Gap(DSSpacing.spacing1),
        icon ?? const SizedBox(),
      ],
    );
  }
}

enum DsTitleType {
  normal,
  header,
  body,
  caption,
}
