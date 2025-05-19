part of '../../../ds.dart';

class DsInfinitePageInation<T, K> extends StatefulWidget {
  const DsInfinitePageInation({
    super.key,
    required this.pagingController,
    required this.itemBuilder,
    this.animateTransitions = true,
    this.transitionDuration = const Duration(milliseconds: 250),
    this.firstPageErrorIndicatorBuilder,
    this.newPageErrorIndicatorBuilder,
    this.firstPageProgressIndicatorBuilder,
    this.newPageProgressIndicatorBuilder,
    this.noItemsFoundIndicatorBuilder,
    this.noMoreItemsIndicatorBuilder,
    this.padding = const EdgeInsets.all(8),
    this.separatorBuilder,
    this.enableRefresh = true,
    this.gridDelegate,
    this.isGridView = false,
  });

  final PagingController<T, K> pagingController;

  /// Builder cho item trong danh sách.
  final ItemWidgetBuilder<K> itemBuilder;

  /// Cho phép custom animation.
  final bool animateTransitions;

  /// Thời lượng animation.
  final Duration transitionDuration;

  /// Padding cho list view.
  final EdgeInsetsGeometry padding;

  /// Dùng cho dạng list có separator.
  final IndexedWidgetBuilder? separatorBuilder;

  /// Các builder tuỳ chọn.
  final WidgetBuilder? firstPageErrorIndicatorBuilder;
  final WidgetBuilder? newPageErrorIndicatorBuilder;
  final WidgetBuilder? firstPageProgressIndicatorBuilder;
  final WidgetBuilder? newPageProgressIndicatorBuilder;
  final WidgetBuilder? noItemsFoundIndicatorBuilder;
  final WidgetBuilder? noMoreItemsIndicatorBuilder;

  /// Cho phép kéo để refresh (reload).
  final bool enableRefresh;

  final SliverGridDelegate? gridDelegate;
  final bool isGridView;

  @override
  State<DsInfinitePageInation<T, K>> createState() =>
      _DsInfinitePageInationState<T, K>();
}

class _DsInfinitePageInationState<T, K>
    extends State<DsInfinitePageInation<T, K>> {
  // @override
  // void dispose() {
  //   widget.pagingController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final listView = _buildPagedListView();

    if (widget.enableRefresh) {
      return RefreshIndicator(
        onRefresh: () async {
          widget.pagingController.refresh();
        },
        child: listView,
      );
    }

    return listView;
  }

  Widget _buildPagedListView() {
    final builderDelegate = PagedChildBuilderDelegate<K>(
      itemBuilder: widget.itemBuilder,
      animateTransitions: widget.animateTransitions,
      transitionDuration: widget.transitionDuration,
      firstPageProgressIndicatorBuilder:
          widget.firstPageProgressIndicatorBuilder ??
              (context) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CupertinoActivityIndicator(),
                        const SizedBox(height: 8),
                        Text(
                          'Đang tải dữ liệu...',
                          style: DSTextStyle.bodyMedium,
                        ),
                      ],
                    ),
                  ),
      newPageProgressIndicatorBuilder: widget.newPageProgressIndicatorBuilder ??
          (context) => const Center(
                child: CupertinoActivityIndicator(),
              ),
      firstPageErrorIndicatorBuilder: widget.firstPageErrorIndicatorBuilder ??
          (context) => Center(
                child: Text(
                  'Có lỗi xảy ra khi tải dữ liệu 😢',
                  style: DSTextStyle.bodyMedium,
                ),
              ),
      newPageErrorIndicatorBuilder: widget.newPageErrorIndicatorBuilder ??
          (context) => Center(
                child: Text(
                  'Tải thêm thất bại 😢',
                  style: DSTextStyle.bodyMedium,
                ),
              ),
      noItemsFoundIndicatorBuilder: widget.noItemsFoundIndicatorBuilder ??
          (context) => Center(
                child: Text(
                  'Không tìm thấy dữ liệu ✨',
                  style: DSTextStyle.bodyMedium,
                ),
              ),
      noMoreItemsIndicatorBuilder: widget.noMoreItemsIndicatorBuilder ??
          (context) => Padding(
                padding: EdgeInsets.all(DSSpacing.spacing6),
                child: Text(
                  'Đã tải hết dữ liệu 🎉',
                  textAlign: TextAlign.center,
                  style: DSTextStyle.bodyMedium,
                ),
              ),
    );

    if (widget.separatorBuilder != null) {
      return PagedListView<T, K>.separated(
        pagingController: widget.pagingController,
        padding: widget.padding,
        builderDelegate: builderDelegate,
        separatorBuilder: widget.separatorBuilder!,
      );
    }

    return !widget.isGridView
        ? PagedListView<T, K>(
            pagingController: widget.pagingController,
            padding: widget.padding,
            builderDelegate: builderDelegate,
          )
        : PagedGridView(
            pagingController: widget.pagingController,
            gridDelegate: widget.gridDelegate ??
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
            builderDelegate: builderDelegate,
            padding: widget.padding,
          );
  }
}
