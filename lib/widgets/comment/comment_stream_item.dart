import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;
import 'package:openwykop/services/wykop_colors.dart';
import 'package:openwykop/widgets/widgets.dart';

class CommentStreamItem extends StatelessWidget {

  final api_models.Comment commentData;

  const CommentStreamItem({
    super.key,
    required this.commentData,
  });

  List<Widget> _buildContentWidgets () {
    List<Widget> widgets = [];

    bool haveContent = commentData.content != null && commentData.content!.isNotEmpty;
    bool havePhoto = commentData.media?.photo != null;
    bool haveEmbed = commentData.media?.embed != null;

    bool isOnlyForAdult = commentData.adult ?? false;
    bool isNSFW = (commentData.content ?? '').contains('#nsfw');

    if (haveContent) {
      widgets.add(Container(
        alignment: Alignment.topLeft,
        child: ContentBody(content: commentData.content!),
      ));
    }

    if (havePhoto) {
      widgets.add(StreamItemPhoto(photoData: commentData.media!.photo, isOnlyForAdult: isOnlyForAdult, isNSFW: isNSFW));
    }

    if (haveEmbed) {
      widgets.add(StreamItemEmbed(embedData: commentData.media!.embed));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {

    String avatar = commentData.author?.getAvatar(size: 80) ?? '';
    Color userColor = WykopColorsService().getUserColor(commentData.author?.color ?? 'orange', Theme.of(context).brightness == Brightness.dark);

    double avatarSize = Theme.of(context).textTheme.headlineLarge?.fontSize ?? 16;
    avatarSize = avatarSize * 1.1;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WykopAvatar(size: avatarSize, avatarUrl: avatar, gender: commentData.author?.gender, backgroundColor: userColor),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  CommentHeader(userData: commentData.author, entryCreatedAt: commentData.createdAt),
                  ..._buildContentWidgets().map((e) => Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: e,
                  )).toList(),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: CommentActions(commentData: commentData),
                  ),
                ]
              ),
            )
          )
        ],
      )
    );
  }
}