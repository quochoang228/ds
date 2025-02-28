part of '../../../ds.dart';

typedef MediaSelectViewCallback = void Function(String? mediaPath);

typedef OnRemoveFile = Function(int index, MediaDto mediaDto);

class MediaSelectView extends StatefulWidget {
  const MediaSelectView({
    super.key,
    this.title,
    required this.mediaDTOs,
    this.itemBuilder,
    this.onRemoveFile,
  });

  final String? title;
  final List<MediaDto> mediaDTOs;
  final NullableIndexedWidgetBuilder? itemBuilder;
  final OnRemoveFile? onRemoveFile;

  @override
  State<MediaSelectView> createState() => _MediaSelectViewState();
}

class _MediaSelectViewState extends State<MediaSelectView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? DsTitle(
                title: widget.title ?? '',
              )
            : const SizedBox.shrink(),
        const Gap(DSSpacing.spacing2),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: widget.mediaDTOs.length + 1,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: widget.itemBuilder ??
              (context, index) {
                if (index == widget.mediaDTOs.length) {
                  return InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CDNAssets.icons.iconCircle.svg(
                          colorFilter: const ColorFilter.mode(
                            DSCoreColors.blue,
                            BlendMode.srcIn,
                          ),
                        ),
                        const Gap(DSSpacing.spacing1),
                        Text(
                          'context.l10n.addNewMedia',
                          textAlign: TextAlign.center,
                          style: DSTextStyle.captionLarge.medium().copyWith(
                                color: DSCoreColors.blue,
                              ),
                        ),
                      ],
                    ),
                    // child: DottedBorder(
                    //   dashPattern: const [5, 5],
                    //   borderType: BorderType.RRect,
                    //   radius: const Radius.circular(4),
                    //   color: DSCoreColors.blue,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.stretch,
                    //     children: [
                    //       CDNAssets.icons.infoCircle.svg(
                    //         colorFilter: const ColorFilter.mode(
                    //           DSCoreColors.blue,
                    //           BlendMode.srcIn,
                    //         ),
                    //       ),
                    //       const Gap(DSSpacing.spacing1),
                    //       Text(
                    //         'context.l10n.addNewMedia',
                    //         textAlign: TextAlign.center,
                    //         style: DSTextStyle.captionLarge.medium().copyWith(
                    //               color: DSCoreColors.blue,
                    //             ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  );
                }
                var file = widget.mediaDTOs[index];
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: file.file != null
                          ? Image.file(
                              file.file!,
                              fit: BoxFit.cover,
                            )
                          : (file.base64 ?? '').isNotEmpty
                              ? Image.memory(
                                  base64Decode(file.base64 ?? ''),
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: DSCoreColors.neutral01,
                                  ),
                                  child: CDNAssets.icons.copy.svg(),
                                ),
                    ),
                    widget.onRemoveFile != null
                        ? Positioned(
                            top: 4,
                            right: 4,
                            child: InkWell(
                              onTap: () {
                                widget.onRemoveFile?.call(index, file);
                              },
                              child: CDNAssets.icons.infoCircle.svg(
                                width: 20,
                                height: 20,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                );
              },
        ),
      ],
    );
  }
}
