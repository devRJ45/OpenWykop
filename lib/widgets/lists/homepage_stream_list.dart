import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:openwykop/api/api_output_list.dart';
import 'package:openwykop/api/models/models.dart' as api_models;
import 'package:openwykop/services/api.dart';
import 'package:openwykop/widgets/widgets.dart';

class HomepageStreamList extends StatefulWidget {
  
  final String sort;

  const HomepageStreamList({
    super.key,
    required this.sort,
  });

  @override
  State<HomepageStreamList> createState() => _HomepageStreamListState();
}

class _HomepageStreamListState extends State<HomepageStreamList> {

  final PagingController<api_models.Pagination, api_models.StreamItem> _pagingController = PagingController(firstPageKey: api_models.Pagination.fromJson({}));

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(api_models.Pagination pageKey) async {
     try {
      ApiOutputList<api_models.StreamItem> entriesPage = await ApiService.api.links.getLinks(type: 'homepage', pageHash: pageKey.next, sort: widget.sort);

      if (entriesPage.pagination != null) {
        if (entriesPage.data != null) {
          _pagingController.appendPage(entriesPage.data!.whereType<api_models.StreamItem>().toList(), entriesPage.pagination!);
        } else {
          _pagingController.appendPage([], entriesPage.pagination!);
        }
      } else {
        if (entriesPage.data != null) {
          _pagingController.appendLastPage(entriesPage.data!.whereType<api_models.StreamItem>().toList());
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
      child: PagedListView<api_models.Pagination, api_models.StreamItem>(
        padding: EdgeInsets.zero,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<api_models.StreamItem>(
          itemBuilder: (context, itemData, index) {
            switch (itemData.resource) {
              case 'link':
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: LinkStreamItem(
                    linkData: itemData as api_models.Link,
                  )
                );
              case 'entry':
                 return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: EntryStreamItem(
                    entryData: itemData as api_models.Entry,
                  )
                );
              default:
                return Container();
            }
          }
        )
      )
    );
  }
}