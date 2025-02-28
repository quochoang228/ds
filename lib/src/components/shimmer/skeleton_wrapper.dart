part of '../../../ds.dart';

class SkeletonWrapper extends StatefulWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  const SkeletonWrapper({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  @override
  SkeletonWrapperState createState() => SkeletonWrapperState();
}

class SkeletonWrapperState extends State<SkeletonWrapper> {
  int _offset = 0;
  late int time;

  @override
  Widget build(BuildContext context) {
    _offset += 15;
    time = 800 + _offset;

    return Shimmer.fromColors(
      // baseColor: widget.baseColor ?? const Color.fromRGBO(230, 231, 233, 1),
      // highlightColor: widget.highlightColor ?? const Color.fromRGBO(249, 249, 249, 1),
      baseColor: DSCoreColors.neutral02,
      highlightColor: DSCoreColors.neutral03,
      // highlightColor: AIOxColors.hexColor('F3F3F3'),
      period: const Duration(seconds: 1),
      // period: Duration(milliseconds: _time),
      child: widget.child,
    );
  }
}
