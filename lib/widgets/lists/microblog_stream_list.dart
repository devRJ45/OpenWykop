import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:openwykop/api/api_output_list.dart';
import 'package:openwykop/api/models/models.dart' as api_models;
import 'package:openwykop/services/api.dart';
import 'package:openwykop/widgets/widgets.dart';

class MicroblogStreamList extends StatefulWidget {
  
  final String sort;
  final int? lastUpdate;

  const MicroblogStreamList({
    super.key,
    required this.sort,
    this.lastUpdate
  });

  @override
  State<MicroblogStreamList> createState() => _MicroblogStreamListState();
}

class _MicroblogStreamListState extends State<MicroblogStreamList> {

  final PagingController<api_models.Pagination, api_models.Entry> _pagingController = PagingController(firstPageKey: api_models.Pagination.fromJson({}));

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(api_models.Pagination pageKey) async {
     try {
      ApiOutputList<api_models.Entry> entriesPage = await ApiService.api.microblog.getEntries(pageHash: pageKey.next, sort: widget.sort, lastUpdate: widget.lastUpdate);

      if (entriesPage.pagination != null) {
        if (entriesPage.data != null) {
          _pagingController.appendPage(entriesPage.data!.whereType<api_models.Entry>().toList(), entriesPage.pagination!);
        } else {
          _pagingController.appendPage([], entriesPage.pagination!);
        }
      } else {
        if (entriesPage.data != null) {
          _pagingController.appendLastPage(entriesPage.data!.whereType<api_models.Entry>().toList());
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
      child: PagedListView<api_models.Pagination, api_models.Entry>(
        padding: EdgeInsets.zero,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<api_models.Entry>(
          itemBuilder: (context, entryData, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: EntryStreamItem(
              entryData: entryData,
            ),
          )
        )
      )
    );
  }
}