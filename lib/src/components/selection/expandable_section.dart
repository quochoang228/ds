part of '../../../ds.dart';

class ExpandableSection extends StatefulWidget {
  final Widget child;
  final String? title;
  final Widget? action;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const ExpandableSection({
    super.key,
    required this.child,
    this.title,
    this.action,
    this.padding,
    this.backgroundColor = DSCoreColors.white,
  });

  @override
  ExpandableSectionState createState() => ExpandableSectionState();
}

class ExpandableSectionState extends State<ExpandableSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300), // Tăng thời gian để hiệu ứng mượt hơn
      vsync: this,
    );
    _heightFactor = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Sử dụng CurvedAnimation để tạo hiệu ứng
    );
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.key,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: _toggleExpand,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: DSSpacing.spacing3,
              horizontal: DSSpacing.spacing4,
            ),
            decoration: BoxDecoration(
              color: DSCoreColors.white,
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(8),
              //   topRight: Radius.circular(8),
              // ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title ?? '',
                    style: DSTextStyle.headlineMedium,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                widget.action ?? SizedBox.shrink(),
                _isExpanded
                    ? SvgPicture.asset(
                        DSAssets.arrow1UpBig,
                        colorFilter: ColorFilter.mode(DSCoreColors.black, BlendMode.srcIn),
                        package: DSStrings.flutterPackageName,
                      )
                    : SvgPicture.asset(
                        DSAssets.arrow1DownBig,
                        colorFilter: ColorFilter.mode(DSCoreColors.black, BlendMode.srcIn),
                        package: DSStrings.flutterPackageName,
                      ),
              ],
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ClipRect(
              child: Align(
                heightFactor: _heightFactor.value,
                child: child,
              ),
            );
          },
          child: Container(
            color: widget.backgroundColor,
            width: double.maxFinite,
            padding: widget.padding ?? EdgeInsets.all(DSSpacing.spacing4),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
