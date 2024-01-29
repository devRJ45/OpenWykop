import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openwykop/services/wykop_colors.dart';

class WykopAvatar extends StatelessWidget {
  
  final String? avatarUrl;
  final String? gender;
  final double size;
  final Color? backgroundColor;
  
  const WykopAvatar({
    super.key,
    this.avatarUrl,
    this.gender,
    required this.size,
    this.backgroundColor,
  });

  Widget _createDefaultAvatar (BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: backgroundColor ?? Theme.of(context).colorScheme.secondaryContainer
      ),
      child: Image.asset('assets/avatar/default.png'), 
    );
  }

  @override
  Widget build(BuildContext context) {

    String avatarUrl = this.avatarUrl ?? '';
    bool genderIsSet = gender == 'm' || gender == 'f';
    Color genderColor = WykopColorsService().getGenderColor(gender);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          if (avatarUrl.isEmpty)
            _createDefaultAvatar(context),
          if (avatarUrl.isNotEmpty)
            CachedNetworkImage(
              imageUrl: avatarUrl,
              imageBuilder: (context, imageProvider) => Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: imageProvider, 
                    fit: BoxFit.cover
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).colorScheme.secondaryContainer.withAlpha(100)
                ),
              ),
              errorWidget: (context, url, error) => _createDefaultAvatar(context),
            ),
          Visibility(
            visible: genderIsSet,
            child: Positioned(
              bottom: -2,
              right: -2,
              child: Container(
                width: size * 0.4,
                height: size * 0.4,
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
    );
  }
}