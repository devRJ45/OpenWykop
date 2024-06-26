import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;
import 'package:openwykop/services/timeago.dart';
import 'package:openwykop/services/wykop_colors.dart';

class CommentHeader extends StatelessWidget {

  final api_models.ProfileShort? userData;
  final String? entryCreatedAt;
  final VoidCallback? onTapMoreButton;

  const CommentHeader({
    super.key,
    this.userData,
    this.entryCreatedAt,
    this.onTapMoreButton,
  });

  @override
  Widget build(BuildContext context) {

    String username = userData?.username ?? '?????';
    String timeagoText = 'chwilę temu';
    Color userColor = WykopColorsService().getUserColor(userData?.color ?? 'orange', Theme.of(context).brightness == Brightness.dark);

    timeagoText = Timeago.parse(entryCreatedAt ?? '');

    double avatarSize = Theme.of(context).textTheme.headlineLarge?.fontSize ?? 16;
    avatarSize = avatarSize * 1.1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: userColor)),
              Text(timeagoText, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey))
            ],
          )
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

