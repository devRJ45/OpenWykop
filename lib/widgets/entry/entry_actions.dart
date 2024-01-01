import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;

class EntryActions extends StatelessWidget {

  final api_models.Entry? entryData;
  final VoidCallback? onTapVoteButton;
  final VoidCallback? onTapCommentsButton;
  final VoidCallback? onTapFavoriteButton;

  EntryActions({
    super.key,
    this.entryData,
    this.onTapVoteButton,
    this.onTapCommentsButton,
    this.onTapFavoriteButton,
  });

  @override
  Widget build(BuildContext context) {

    bool isFavourite = entryData?.favourite ?? false;
    bool isVoted = entryData?.voted == null ? false : (entryData?.voted == 1 ? true : false);
    int commentsCount = entryData?.comments?.count ?? 0;
    int votesCount = entryData?.votes?.up ?? 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {if(onTapFavoriteButton == null) return; onTapFavoriteButton!();},
              child: isFavourite ? const Icon(Icons.star) : const Icon(Icons.star_border)
            )
          ), 
        ),
        InkWell(
          onTap: () {if(onTapCommentsButton == null) return; onTapCommentsButton!();},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 1,
              children: [
                const Icon(Icons.forum_outlined),
                Text(commentsCount.toString(), style: Theme.of(context).textTheme.labelMedium)
              ],
            ),
          )
        ),
        InkWell(
          onTap: () {if(onTapVoteButton == null) return; onTapVoteButton!();},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 1,
              children: [
                isVoted ? const Icon(Icons.add_box) : const Icon(Icons.add_box_outlined),
                Text(votesCount.toString(), style: Theme.of(context).textTheme.labelMedium)
              ],
            ),
          )
        ),
      ],
    );
  }
}

