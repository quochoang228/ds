part of '../../ds.dart';

typedef ItemWidgetBuilder<ItemType> = Widget Function(
    BuildContext context,
    ItemType item,
    int index,
    );

class DsInfinitePageInation<T, K> extends StatefulWidget {
  const DsInfinitePageInation({
    super.key,
    required this.pagingController,
    required this.itemBuilder,
    this.animateTransitions,
    this.transitionDuration = const Duration(milliseconds: 250),
    this.firstPageErrorIndicatorBuilder,
    this.newPageErrorIndicatorBuilder,
    this.firstPageProgressIndicatorBuilder,
    this.newPageProgressIndicatorBuilder,
    this.noItemsFoundIndicatorBuilder,
    this.noMoreItemsIndicatorBuilder,
  });

  final PagingController<T, K> pagingController;

  /// The builder for list items.
  final ItemWidgetBuilder<K> itemBuilder;

  /// The builder for the first page's error indicator.
  final WidgetBuilder? firstPageErrorIndicatorBuilder;

  /// The builder for a new page's error indicator.
  final WidgetBuilder? newPageErrorIndicatorBuilder;

  /// The builder for the first page's progress indicator.
  final WidgetBuilder? firstPageProgressIndicatorBuilder;

  /// The builder for a new page's progress indicator.
  final WidgetBuilder? newPageProgressIndicatorBuilder;

  /// The builder for a no items list indicator.
  final WidgetBuilder? noItemsFoundIndicatorBuilder;

  /// The builder for an indicator that all items have been fetched.
  final WidgetBuilder? noMoreItemsIndicatorBuilder;

  /// Whether status transitions should be animated.
  final bool? animateTransitions;

  /// The duration of animated transitions when [animateTransitions] is `true`.
  final Duration transitionDuration;

  @override
  State<DsInfinitePageInation> createState() =>
      _DsInfinitePageInationState<T, K>();
}

class _DsInfinitePageInationState<T, K> extends State<DsInfinitePageInation> {
  @override
  void dispose() {
    widget.pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<dynamic, dynamic>(
      pagingController: widget.pagingController,
      padding: const EdgeInsets.all(8),
      builderDelegate: PagedChildBuilderDelegate<K>(
        animateTransitions: true,
        noMoreItemsIndicatorBuilder: widget.noMoreItemsIndicatorBuilder ??
                (context) =>
                Column(
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'Không còn dữ liệu để hiển thị ✨',
                    ),
                  ],
                ),
        firstPageProgressIndicatorBuilder:
        widget.firstPageProgressIndicatorBuilder ??
                (context) =>
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(),
                SizedBox(height: 8),
                Text('Đang tải dữ liệu...'),
              ],
            ),
        firstPageErrorIndicatorBuilder: widget.firstPageErrorIndicatorBuilder ??
                (context) =>
                Column(
                  children: [
                    SizedBox(height: 16),
                    Text('Có lỗi xảy ra khi tải dữ liệu 😢'),
                  ],
                ),
        newPageProgressIndicatorBuilder:
        widget.newPageProgressIndicatorBuilder ??
                (context) =>
            const Center(
              child: CupertinoActivityIndicator(),
            ),
        newPageErrorIndicatorBuilder: (context) =>
            Column(
              children: [
                const SizedBox(height: 16),
                Text('Có lỗi xảy ra khi tải dữ liệu 😢')
              ],
            ),
        itemBuilder: widget.itemBuilder,
        noItemsFoundIndicatorBuilder: widget.noItemsFoundIndicatorBuilder,
        transitionDuration: widget.transitionDuration,
      ),
    );
  }
}
