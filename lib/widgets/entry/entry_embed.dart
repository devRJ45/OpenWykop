import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;

class EntryEmbed extends StatelessWidget {

  final api_models.Embed? embedData;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const EntryEmbed({
    super.key,
    this.embedData,
    this.onTap,
    this.onLongPress,
  });

  Color _getColorByType (String type) {
    switch (type) {
      case 'twitter':
        return Colors.black;
      case 'instagram':
        return const Color(0xffd1006d);
      case 'streamable':
        return const Color(0xff0691fa);
      case 'youtube':
        return const Color(0xffff0000);
      default:
        return Colors.black;
    }
  }

  String _getLogoAssetPathByType (String type) {
    switch (type) {
      case 'twitter':
        return 'assets/embed_logo/x-white.png';
      case 'instagram':
        return 'assets/embed_logo/instagram-white.png';
      case 'streamable':
        return 'assets/embed_logo/streamable-white.png';
      case 'youtube':
      default:
        return 'assets/embed_logo/youtube-white.png';
    }
  }

  @override
  Widget build(BuildContext context) {

    bool haveThumbnail = embedData?.thumbnail == null ? false : true;
    String thumbnail = embedData?.thumbnail ?? '';

    return GestureDetector(
      onTap: () {
        if (onTap == null) {
          return;
        }
        onTap!();
      },
      onLongPress: () {
        if (onLongPress == null) {
          return;
        }
        onLongPress!();
      },
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: AspectRatio(
          aspectRatio: 16/9,
          child: Stack(
            children: [
              haveThumbnail ? CachedNetworkImage(
                imageUrl: thumbnail,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: imageProvider, 
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator()
                ),
                errorWidget: (context, url, error) => Container(
                  alignment: Alignment.center,
                  child: const Icon(Icons.no_photography_outlined)
                ),
              ) : Container(),
              Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  child: Card(
                    color: _getColorByType(embedData?.type ?? ''),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(_getLogoAssetPathByType(embedData?.type ?? ''), width: Theme.of(context).textTheme.headlineMedium?.fontSize)
                    )
                  )
                )
              )
            ]
          ),
        )
      ),
    );
  }
}