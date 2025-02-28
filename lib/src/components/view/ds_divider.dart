part of '../../../ds.dart';

class DsDivider extends StatelessWidget {
  const DsDivider({
    super.key,
    this.color,
    this.height,
    this.thickness,
  });

  final Color? color;
  final double? height;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? DSColors.borderDivider,
      thickness: thickness ?? 1,
      height: height ?? 1,
    );
  }
}
