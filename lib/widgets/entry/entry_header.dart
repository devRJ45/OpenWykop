import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;

class EntryHeader extends StatelessWidget {

  final api_models.ProfileShort? userData;
  final String? timeago;
  final VoidCallback? onTapMoreButton;

  EntryHeader({
    super.key,
    this.userData,
    this.timeago,
    this.onTapMoreButton,
  });

  Color _getUserColor (String colorName) {
    switch (colorName) {
      case 'green':
        return const Color(0xff339933);
      case 'burgundy':
        return const Color(0xffc13838);
      case 'orange':
      default:
        return const Color(0xffff5917);
    }
  }

  @override
  Widget build(BuildContext context) {

    String username = userData?.username ?? '?????';
    String timeagoText = timeago ?? 'Przed chwilą';
    String avatar = userData?.avatar ?? '';
    String userColor = userData?.color ?? 'orange';

    double avatarSize = Theme.of(context).textTheme.headlineLarge?.fontSize ?? 16;
    avatarSize = avatarSize * 1.1;


    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: avatarSize,
          height: avatarSize,
          child: CachedNetworkImage(
            imageUrl: avatar,
            imageBuilder: (context, imageProvider) => Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => Opacity(opacity: 0.5, child: Icon(Icons.account_circle_outlined, size: avatarSize)),
            errorWidget: (context, url, error) => Icon(Icons.account_circle_outlined, size: avatarSize),
          )
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: _getUserColor(userColor))),
                Text(timeagoText, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey))
              ],
            )
          ),
        ),
        IconButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            minimumSize: Size(avatarSize, avatarSize),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.center,
          ), 
          onPressed: () {
            if (onTapMoreButton != null) {
              onTapMoreButton!();
            }
          }, 
          icon: Icon(Icons.more_vert, size: avatarSize * 0.55)
        )
      ],
    );
  }
}

