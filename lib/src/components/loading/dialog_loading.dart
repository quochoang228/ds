part of '../../../ds.dart';


class ContentLoading extends StatelessWidget {
  final String? content;
  final BoxConstraints constraints;

  const ContentLoading({
    super.key,
    this.content,
    this.constraints = const BoxConstraints(
      minWidth: 130,
      maxWidth: 130,
      minHeight: 50,
      maxHeight: 50,
    ),
  });

  @override
  Widget build(BuildContext context) {
    // double loadingMaxWidth = MediaQuery.of(context).size.width * 2 / 3;
    double iconSize = 19.0;
    double textLeftPadding = 12.0;
    double outPadding = 10.0;
    String loadingText = content ?? "Loading...";

    return Center(
      child: Container(
        padding: EdgeInsets.all(outPadding),
        constraints: BoxConstraints(
          // maxWidth: maxWidth,
          maxWidth: MediaQuery.of(context).size.width * 0.5,
          minWidth: iconSize + textLeftPadding,
        ),
        height: 50,
        // width: loadingMaxWidth,
        decoration: BoxDecoration(
          color: DSColors.backgroundGray3,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: iconSize,
                width: iconSize,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation(
                    DSCoreColors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: textLeftPadding),
                  child: Text(
                    loadingText,
                    maxLines: 1,
                    style: DSTextStyle.captionMedium.copyWith(
                      color: DSCoreColors.white,
                      decoration: TextDecoration.none,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingDialog extends Dialog {
  static const String _loadingDialogTag = '_loadingDialogTag';

  final String? content;

  const LoadingDialog({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    return ContentLoading(content: content ?? 'Loading...');
  }

  static Future<T?> show<T>(
    BuildContext context, {
    String? content,
    // bool barrierDismissible = true,
    bool barrierDismissible = false,
    bool useRootNavigator = true,
  }) {
    return SafeDialog.show<T>(
        context: context,
        tag: _loadingDialogTag,
        barrierDismissible: barrierDismissible,
        useRootNavigator: useRootNavigator,
        builder: (_) {
          return LoadingDialog(content: content ?? 'Loading...');
        });
  }

  static void dismiss<T extends Object?>(BuildContext context, [T? result]) {
    SafeDialog.dismiss<T>(context: context, tag: _loadingDialogTag, result: result);
  }
}
