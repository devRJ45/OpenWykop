import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:openwykop/api/api_output_list.dart';
import 'package:openwykop/api/models/models.dart' as api_models;
import 'package:openwykop/services/api.dart';
import 'package:openwykop/widgets/widgets.dart';

class EntryCommentsList extends StatefulWidget {
  
  final api_models.Entry? entryData;

  const EntryCommentsList({
    super.key,
    this.entryData
  });

  @override
  State<EntryCommentsList> createState() => _EntryCommentsListState();
}

class _EntryCommentsListState extends State<EntryCommentsList> {

  final PagingController<int, api_models.StreamItem> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int page) async {
    if (widget.entryData != null) {
      if (page == 0) {
        _pagingController.appendPage([widget.entryData!], ++page);
        return;
      }
    }
  
     try {
      ApiOutputList<api_models.StreamItem> commentsPage = await ApiService.api.microblog.getComments(widget.entryData?.id ?? 0, page: page);

      if (commentsPage.pagination != null) {
        if (commentsPage.data != null) {
          _pagingController.appendPage(commentsPage.data!.whereType<api_models.StreamItem>().toList(), ++page);
        } else {
          _pagingController.appendPage([], ++page);
        }
      } else {
        if (commentsPage.data != null) {
          _pagingController.appendLastPage(commentsPage.data!.whereType<api_models.StreamItem>().toList());
        } else {
          _pagingController.appendLastPage([]);
        }
      }

    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    _pagingController.refresh();

    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView<int, api_models.StreamItem>(
        padding: EdgeInsets.zero,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<api_models.StreamItem>(
          itemBuilder: (context, itemData, index) {
            if (itemData.resource == 'entry') {
              api_models.Entry entry = itemData as api_models.Entry;
              
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: EntryStreamItem(entryData: entry)
              );
            }

            if (itemData.resource == 'entry_comment') {
              api_models.Comment comment = itemData as api_models.Comment;
              
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: CommentStreamItem(commentData: comment)
              );
            }

            return Container();
          }
        )
      )
    );
  }
}