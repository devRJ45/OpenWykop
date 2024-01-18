import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;
import 'package:openwykop/screens/link_screen.dart';
import 'package:openwykop/services/timeago.dart';
import 'package:openwykop/services/wykop_colors.dart';
import 'package:openwykop/widgets/widgets.dart';

class LinkStreamItem extends StatelessWidget {

  final api_models.Link linkData;

  const LinkStreamItem({
    super.key,
    required this.linkData,
  });

  @override
  Widget build(BuildContext context) {

    String title = linkData.title ?? '';
    String description = linkData.description ?? '';

    String timeagoText = 'chwilę temu';
    timeagoText = Timeago.parse(linkData.createdAt ?? '');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinkMedia(mediaData: linkData.media),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(title, style: Theme.of(context).textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          Text(description, style: Theme.of(context).textTheme.bodyMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: WykopAvatarCircle(avatarUrl: linkData.author?.getAvatar(size: 80), size: Theme.of(context).textTheme.bodyMedium?.fontSize ?? 16),
                ),
                Expanded(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: linkData.author?.username ?? '',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: WykopColorsService().getUserColor(linkData.author?.color ?? 'orange'), fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                          text: ' • $timeagoText • ${linkData.tags?.map((tag) => '#$tag').join(' ')}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.secondary)
                        )
                      ]
                    )
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: LinkActions(linkData: linkData, onTapCommentsButton: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LinkScreen(linkData: linkData,);
              }));
            },),
          ),
        ]
      )
    );
  }
}