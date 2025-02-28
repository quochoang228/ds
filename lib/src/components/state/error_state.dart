part of '../../../ds.dart';

class BaseErrorState extends StatelessWidget {
  const BaseErrorState({
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
          DSAssets.stateError,
          package: DSStrings.flutterPackageName,
          width: MediaQuery.sizeOf(context).width * 0.35,
          height: MediaQuery.sizeOf(context).width * 0.35,
        ),
        const Gap(DSSpacing.spacing2),
        Text(
          title ?? DSStrings.errorStateTitle,
          style: DSTextStyle.titleSmall,
        ),
        const Gap(DSSpacing.spacing2),
        Text(
          msg ?? DSStrings.errorStateMsg,
          style: DSTextStyle.captionLarge,
        ),
      ],
    );
  }
}
