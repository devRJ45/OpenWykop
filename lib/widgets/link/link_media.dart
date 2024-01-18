import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;

class LinkMedia extends StatefulWidget  {
  
  final api_models.Media? mediaData;
  final bool isOnlyForAdult;
  final bool isNSFW;
  
  const LinkMedia({
    super.key,
    this.mediaData,
    this.isOnlyForAdult = false,
    this.isNSFW = false,
  });

  @override
  State<LinkMedia> createState() => _LinkMediaState();
}

class _LinkMediaState extends State<LinkMedia> with AutomaticKeepAliveClientMixin {

  bool hideAdult = true;
  String thumbnailUrl = '';
  String? embedType = null;

  @override
  void initState() {
    super.initState();
    hideAdult = true;
    embedType = widget.mediaData?.embed?.type;
    // thumbnailUrl = widget.photoData?.getThumbnailUrl() ?? '';
  }

  void _onTapImage () {
    if ((widget.isOnlyForAdult || widget.isNSFW) && hideAdult) {
      setState(() {
        hideAdult = false;
      });
      return;
    }
  }

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
    super.build(context);

    if (widget.mediaData?.photo?.url != null) {
      thumbnailUrl = widget.mediaData!.photo!.getThumbnailUrl() ?? '';
    }
    

    return GestureDetector(
      onTap: _onTapImage,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: AspectRatio(
          aspectRatio: 16/9,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: thumbnailUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: imageProvider, 
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: const Icon(Icons.image_outlined)
                ),
                errorWidget: (context, url, error) => Container(
                  alignment: Alignment.center,
                  child: const Icon(Icons.no_photography_outlined)
                ),
              ),
              if (embedType != null)
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    child: Card(
                      color: _getColorByType(embedType ?? ''),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(_getLogoAssetPathByType(embedType ?? ''), width: Theme.of(context).textTheme.headlineMedium?.fontSize)
                      )
                    )
                  )
                ),
              if ((widget.isOnlyForAdult || widget.isNSFW) && hideAdult)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 25,
                      sigmaY: 25
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Card(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Icon(Icons.remove_red_eye_outlined),
                              if (widget.isOnlyForAdult)
                                Text('+18', style: Theme.of(context).textTheme.labelMedium),
                              if (!widget.isOnlyForAdult && widget.isNSFW)
                                Text('#nsfw', style: Theme.of(context).textTheme.labelMedium),
                            ],
                          )
                        )
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
  
  @override
  bool get wantKeepAlive => true;
}