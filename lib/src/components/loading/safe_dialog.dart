part of '../../../ds.dart';

class SafeDialog {
  static const String _safeDialogDefaultTag = '_safeDialogDefaultTag';
  static final Map<String, List<_SafeDialogRoute>> _dialogStates = {};
  static void dismiss<T extends Object?>({
    required BuildContext context,
    String tag = _safeDialogDefaultTag,
    T? result,
  }) {
    List<_SafeDialogRoute> typeStates = (_dialogStates[tag] ??= []);
    if (typeStates.isNotEmpty) {
      try {
        _SafeDialogRoute safeDialogRoute = typeStates.removeLast();
        Navigator.removeRoute(context, safeDialogRoute);
        if (!safeDialogRoute.completer.isCompleted) {
          safeDialogRoute.completer.complete(result);
        }
      } catch (e) {
        // ignore: todo
        /// TODO 可能会抛出异常, 直接打印到日志区
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    String tag = _safeDialogDefaultTag,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    assert(debugCheckHasMaterialLocalizations(context));
    final CapturedThemes themes = InheritedTheme.capture(
      from: context,
      to: Navigator.of(
        context,
        rootNavigator: useRootNavigator,
      ).context,
    );

    _SafeDialogRoute<T> safeDialogRoute = _SafeDialogRoute<T>(
      context: context,
      builder: builder,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      settings: routeSettings,
      themes: themes,
    );

    // Notice:
    // 关键点, 手动管理 Router
    // 将结果通过 Completer 转发出去
    _dialogStates[tag] ??= [];
    _dialogStates[tag]?.add(safeDialogRoute);
    Future<T?> future =
    Navigator.of(context, rootNavigator: useRootNavigator).push<T>(safeDialogRoute);
    future.then((result) {
      _dialogStates[tag]?.remove(safeDialogRoute);
      if (!safeDialogRoute.completer.isCompleted) {
        safeDialogRoute.completer.complete(result);
      }
    });
    return safeDialogRoute.completer.future;
  }
}
class _SafeDialogRoute<T> extends DialogRoute<T> {

  final Completer<T?> completer = Completer<T?>();

  _SafeDialogRoute({
    required super.context,
    required super.builder,
    super.themes,
    super.barrierColor,
    super.barrierDismissible,
    super.barrierLabel,
    super.useSafeArea,
    super.settings,
  });
}