import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;
import 'package:openwykop/widgets/lists/entry_comments_list.dart';
import 'package:openwykop/widgets/widgets.dart';

class EntryScreen extends StatefulWidget {
  
  final api_models.Entry? entryData;
  
  const EntryScreen({
    super.key,
    this.entryData
  });

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                floating: true,
                pinned: false,
                scrolledUnderElevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size(double.infinity, 0.4),
                  child: Container(
                    color: Theme.of(context).colorScheme.outline.withAlpha(100),
                    height: 0.4
                  )
                )
              ),
            ];
          },
          body: EntryCommentsList(entryData: widget.entryData)
        ),
      )
    );
  }
}