part of '../../../ds.dart';

class DsViewContainer extends StatelessWidget {
  const DsViewContainer({
    super.key,
    required this.child,
    this.title,
    this.rightAction,
    this.onTap,
    this.isHeader = true,
    this.isDivider = true,
    this.isExpandable = false,
    this.paddingContent,
    this.backgroundColor = DSCoreColors.white,
  });

  final Widget child;
  final Widget? rightAction;
  final GestureTapCallback? onTap;
  final String? title;
  final bool isHeader;
  final bool isDivider;
  final bool isExpandable;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? paddingContent;

  @override
  Widget build(BuildContext context) {
    return isExpandable
        ? ExpandableSection(
            title: title,
            action: rightAction,
            backgroundColor: backgroundColor,
            padding: EdgeInsets.all(DSSpacing.spacing4).copyWith(
              top: DSSpacing.spacing0,
            ),
            child: child,
          )
        : InkWell(
            onTap: onTap,
            child: ColoredBox(
              color: DSCoreColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  isHeader
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: DSSpacing.spacing4,
                            vertical: DSSpacing.spacing35,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              title != null
                                  ? Text(
                                      title!,
                                      style: DSTextStyle.headlineMedium,
                                    )
                                  : const SizedBox.shrink(),
                              if (rightAction != null) rightAction!,
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                  isDivider
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: DSSpacing.spacing4,
                          ),
                          child: Divider(
                            color: DSColors.borderDivider,
                            height: 1,
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: paddingContent ??
                        EdgeInsets.all(DSSpacing.spacing4).copyWith(
                          top: isHeader ? DSSpacing.spacing2 : DSSpacing.spacing4,
                        ),
                    child: child,
                  ),
                ],
              ),
            ),
          );
  }
}
