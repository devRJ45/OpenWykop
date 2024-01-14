import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;
import 'package:openwykop/services/timeago.dart';
import 'package:openwykop/services/wykop_colors.dart';

class EntryHeader extends StatelessWidget {

  final api_models.ProfileShort? userData;
  final String? entryCreatedAt;
  final VoidCallback? onTapMoreButton;

  const EntryHeader({
    super.key,
    this.userData,
    this.entryCreatedAt,
    this.onTapMoreButton,
  });

  @override
  Widget build(BuildContext context) {

    String username = userData?.username ?? '?????';
    String timeagoText = 'chwilę temu';
    String avatar = userData?.getAvatar(size: 80) ?? '';
    Color userColor = WykopColorsService().getUserColor(userData?.color ?? 'orange', Theme.of(context).brightness == Brightness.dark);
    bool genderIsSet = userData?.gender == 'm' || userData?.gender == 'f';
    Color genderColor = WykopColorsService().getGenderColor(userData?.gender);

    timeagoText = Timeago.parse(entryCreatedAt ?? '');

    double avatarSize = Theme.of(context).textTheme.headlineLarge?.fontSize ?? 16;
    avatarSize = avatarSize * 1.1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: avatarSize,
          height: avatarSize,
          child: Stack(
            children: [
              CachedNetworkImage(
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
              ),
              Visibility(
                visible: genderIsSet,
                child: Positioned(
                  bottom: -2,
                  right: -2,
                  child: Container(
                    width: avatarSize * 0.4,
                    height: avatarSize * 0.4,
                    decoration: BoxDecoration(
                      color: genderColor,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                  )
                ) 
              )
            ],
          )
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: userColor)),
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

