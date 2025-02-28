part of '../../../ds.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    this.title,
    this.action,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = DSCoreColors.neutral01,
    this.appBarBackgroundColor = DSCoreColors.primary,
    this.bottomAction,
    this.isShowBottomAction = true,
    required this.body,
    this.alignment,
    this.leading,
    this.isShowLeading = true,
    this.floatingActionButton,
  });

  final String? title;
  final Widget body;
  final Widget? leading;
  final Widget? floatingActionButton;
  final bool isShowLeading;
  final List<Widget>? action;
  final Widget? bottomAction;
  final bool isShowBottomAction;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color appBarBackgroundColor;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title != null
            ? Text(
                title!,
                style: DSTextStyleFS.fsHeadlineLarge.applyColor(
                  DSCoreColors.white,
                ),
              )
            : null,
        centerTitle: true,
        actions: action,
        leading: isShowLeading ? leading ?? BackButton(
          color: DSCoreColors.white,
        ) : SizedBox(),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        // Loại bỏ lớp màu tint
        backgroundColor: appBarBackgroundColor,
      ),
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          Container(
            padding: padding,
            margin: EdgeInsets.only(bottom: bottomAction != null ? kBottomNavigationBarHeight + 16 : 0),
            alignment: alignment ?? Alignment.topCenter,
            child: body,
          ),
          bottomAction != null
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: isShowBottomAction ? kBottomNavigationBarHeight + 16 : 0,
                    padding: const EdgeInsets.symmetric(
                      vertical: DSSpacing.spacing2,
                      horizontal: DSSpacing.spacing4,
                    ),
                    decoration: BoxDecoration(
                      color: DSColors.backgroundWhite,
                      boxShadow: const [
                        DSEffect.shadowNavBarEffect1,
                        DSEffect.shadowNavigationBarEffect1,
                      ],
                      // border: Border(
                      //   top: BorderSide(
                      //     color: BaseColors.borderDefault,
                      //     width: 1,
                      //   ),
                      // ),
                    ),
                    child: bottomAction,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
