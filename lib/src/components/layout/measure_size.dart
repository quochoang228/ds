part of '../../../ds.dart';

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSize extends StatefulWidget {
  final Widget child;
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    super.key,
    required this.child,
    required this.onChange,
  });

  @override
  MeasureSizeState createState() => MeasureSizeState();
}

class MeasureSizeState extends State<MeasureSize> {
  Size? oldSize;

  // final GlobalKey _contentKey = GlobalKey();
  // double _contentHeight = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   // Delay 1 frame để layout xong mới đo được
  //   WidgetsBinding.instance.addPostFrameCallback((_) => _updateHeight());
  // }

  // void _updateHeight() {
  //   final context = _contentKey.currentContext;
  //   if (context == null) return;

  //   final box = context.findRenderObject() as RenderBox;
  //   final newHeight = box.size.height;

  //   if (_contentHeight != newHeight) {
  //     setState(() {
  //       _contentHeight = newHeight;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final contextSize = context.size;
      if (contextSize != null && oldSize != contextSize) {
        oldSize = contextSize;
        widget.onChange(contextSize);
      }
    });

    return widget.child;
  }
}
