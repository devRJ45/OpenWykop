import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:openwykop/api/api_output_list.dart';
import 'package:openwykop/api/models/models.dart' as api_models;
import 'package:openwykop/services/api.dart';
import 'package:openwykop/widgets/widgets.dart';

class LinkCommentsList extends StatefulWidget {
  
  final api_models.Link? linkData;

  const LinkCommentsList({
    super.key,
    this.linkData
  });

  @override
  State<LinkCommentsList> createState() => _LinkCommentsListState();
}

class _LinkCommentsListState extends State<LinkCommentsList> {

  final PagingController<int, api_models.StreamItem> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int page) async {
    if (widget.linkData != null) {
      if (page == 0) {
        _pagingController.appendPage([widget.linkData!], ++page);
        return;
      }
    }
  
     try {
      ApiOutputList<api_models.StreamItem> commentsPage = await ApiService.api.links.getComments(widget.linkData?.id ?? 0, page: page, sort: 'best');

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
            if (itemData.resource == 'link') {
              api_models.Link link = itemData as api_models.Link;
              
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: LinkStreamItem(linkData: link)
              );
            }

            if (itemData.resource == 'link_comment') {
              api_models.Comment comment = itemData as api_models.Comment;

              print(comment.comments?.toJson());
              
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