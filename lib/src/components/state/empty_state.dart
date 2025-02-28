part of '../../../ds.dart';

class BaseEmptyState extends StatelessWidget {
  const BaseEmptyState({
    super.key,
    this.title,
    this.msg,
  });

  final String? title;
  final String? msg;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          DSAssets.stateEmpty,
          package: DSStrings.flutterPackageName,
          width: MediaQuery.sizeOf(context).width * 0.35,
          height: MediaQuery.sizeOf(context).width * 0.35,
        ),
        Text(
          title ?? DSStrings.emptyStateTitle,
          style: DSTextStyle.titleSmall,
        ),
        const Gap(DSSpacing.spacing2),
        Text(
          msg ?? DSStrings.emptyStateMsg,
          style: DSTextStyle.captionLarge,
        ),
      ],
    );
  }
}
