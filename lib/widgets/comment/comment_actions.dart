import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;

class CommentActions extends StatelessWidget {

  final api_models.Comment? commentData;
  final VoidCallback? onTapVoteButton;
  final VoidCallback? onTapFavoriteButton;

  const CommentActions({
    super.key,
    this.commentData,
    this.onTapVoteButton,
    this.onTapFavoriteButton,
  });

  @override
  Widget build(BuildContext context) {

    bool isFavourite = commentData?.favourite ?? false;
    bool isVoted = commentData?.voted == null ? false : (commentData?.voted == 1 ? true : false);
    int votesCount = commentData?.votes?.up ?? 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Expanded(
        //   child: Container(
        //     alignment: Alignment.centerLeft,
        //     child: InkWell(
        //       onTap: () {if(onTapFavoriteButton == null) return; onTapFavoriteButton!();},
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //         child: isFavourite ? const Icon(Icons.star) : const Icon(Icons.star_border)
        //       )
        //     )
        //   ), 
        // ),
        InkWell(
          onTap: () {if(onTapFavoriteButton == null) return; onTapFavoriteButton!();},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: isFavourite ? const Icon(Icons.star) : const Icon(Icons.star_border)
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
                isVoted ? const Icon(Icons.add_box, color: Color(0xff71be71)) : const Icon(Icons.add_box_outlined),
                Text(votesCount.toString(), style: Theme.of(context).textTheme.labelLarge)
              ],
            ),
          )
        ),
      ],
    );
  }
}

