part of '../../../ds.dart';

enum DsTextInfoType { vertical, horizontal }

class DsTextInfo extends StatelessWidget {
  const DsTextInfo({
    super.key,
    required this.title,
    required this.subTitle,
    this.type = DsTextInfoType.horizontal,
  });

  final String title;
  final String subTitle;
  final DsTextInfoType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: DSSpacing.spacing15s,
      ),
      child: type == DsTextInfoType.vertical
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DsTitle.body(
                  title: title,
                  color: DSColors.textSubtitle,
                ),
                DsTitle.body(title: subTitle),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    title,
                    style: DSTextStyle.bodySmall.copyWith(
                      color: DSColors.textSubtitle,
                    ),
                  ),
                  // child: DsTitle.body(
                  //   title: title,
                  //   color: DSColors.textSubtitle,
                  // ),
                ),
                const Gap(DSSpacing.spacing2),
                Expanded(
                  flex: 2,
                  child: DsTitle.body(title: subTitle),
                ),
              ],
            ),
    );
  }
}
