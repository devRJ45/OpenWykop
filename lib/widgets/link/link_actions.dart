import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;

class LinkActions extends StatelessWidget {

  final api_models.Link? linkData;
  final VoidCallback? onTapUpVoteButton;
  final VoidCallback? onTapDownVoteButton;
  final VoidCallback? onTapCommentsButton;
  final VoidCallback? onTapFavoriteButton;
  final VoidCallback? onTapMoreButton;

  const LinkActions({
    super.key,
    this.linkData,
    this.onTapUpVoteButton,
    this.onTapDownVoteButton,
    this.onTapCommentsButton,
    this.onTapFavoriteButton,
    this.onTapMoreButton,
  });

  @override
  Widget build(BuildContext context) {

    bool isFavourite = linkData?.favourite ?? false;
    bool isVoted = linkData?.voted == null ? false : (linkData?.voted == 1 ? true : false);
    int commentsCount = linkData?.comments?.count ?? 0;
    int votesCount = linkData?.votes?.up ?? 0;

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
                Icon(Icons.forum_outlined, size: (Theme.of(context).textTheme.titleLarge?.fontSize ?? 16) * 0.9),
                Text(commentsCount.toString(), style: Theme.of(context).textTheme.labelLarge)
              ],
            ),
          )
        ),
        InkWell(
          onTap: () {if(onTapUpVoteButton == null) return; onTapUpVoteButton!();},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                isVoted ? const Icon(Icons.add_box, color: Color(0xff71be71)) : const Icon(Icons.keyboard_arrow_up),
                Text(votesCount.toString(), style: Theme.of(context).textTheme.labelLarge)
              ],
            ),
          )
        ),
        InkWell(
          onTap: () {if(onTapDownVoteButton == null) return; onTapDownVoteButton!();},
          child: Padding(
            padding: const EdgeInsets.only(left: 4, right: 8, top: 4, bottom: 4),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                isVoted ? const Icon(Icons.add_box, color: Color(0xff71be71)) : const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          )
        ),
        InkWell(
          onTap: () {if(onTapMoreButton == null) return; onTapMoreButton!();},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                Icon(Icons.more_vert_outlined, size: (Theme.of(context).textTheme.titleLarge?.fontSize ?? 16) * 0.9),
              ],
            ),
          )
        ),
      ],
    );
  }
}

