import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;

class EntryActions extends StatelessWidget {

  final api_models.Entry? entryData;
  final VoidCallback? onTapVoteButton;
  final VoidCallback? onTapCommentsButton;
  final VoidCallback? onTapFavoriteButton;

  const EntryActions({
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: isFavourite ? const Icon(Icons.star) : const Icon(Icons.star_border)
              )
            )
          ), 
        ),
        InkWell(
          onTap: () {if(onTapCommentsButton == null) return; onTapCommentsButton!();},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                const Icon(Icons.forum_outlined, weight: 1,),
                Text(commentsCount.toString(), style: Theme.of(context).textTheme.labelLarge)
              ],
            ),
          )
        ),
        InkWell(
          onTap: () {if(onTapVoteButton == null) return; onTapVoteButton!();},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                isVoted ? const Icon(Icons.add_box) : const Icon(Icons.add_box_outlined),
                Text(votesCount.toString(), style: Theme.of(context).textTheme.labelLarge)
              ],
            ),
          )
        ),
      ],
    );
  }
}

