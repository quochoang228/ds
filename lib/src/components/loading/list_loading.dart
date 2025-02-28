part of '../../../ds.dart';


class ListLoading extends StatelessWidget {
  const ListLoading({
    super.key,
    this.padding =  EdgeInsets.zero,
  });

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(BaseRadius.radiusMd),
            color: DSColors.backgroundWhite,
          ),
          padding: const EdgeInsets.symmetric(vertical: DSSpacing.spacing2, horizontal: DSSpacing.spacing3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonWrapper(
                child: Container(
                  height: size.height * 0.04,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    color: DSColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(DSRadius.radiusSm),
                  ),
                ),
              ),
              const Gap(DSSpacing.spacing2),
              SkeletonWrapper(
                child: Container(
                  height: DSSpacing.spacing4,
                  decoration: BoxDecoration(
                    color: DSColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(DSRadius.radiusSm),
                  ),
                ),
              ),
              const Gap(DSSpacing.spacing2),
              SkeletonWrapper(
                child: Container(
                  height: DSSpacing.spacing4,
                  decoration: BoxDecoration(
                    color: DSColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(DSRadius.radiusSm),
                  ),
                ),
              ),
              const Gap(DSSpacing.spacing2),
              SkeletonWrapper(
                child: Container(
                  height: DSSpacing.spacing4,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: DSColors.backgroundGray1,
                    borderRadius: BorderRadius.circular(DSRadius.radiusSm),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding,
      separatorBuilder: (context, index) => const Gap(DSSpacing.spacing05),
      itemCount: 3,
    );
  }
}
