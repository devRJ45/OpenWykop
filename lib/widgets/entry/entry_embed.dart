import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;

class EntryEmbed extends StatefulWidget  {
  
  final api_models.Embed? embedData;
  final bool isOnlyForAdult;
  final bool isNSFW;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  
  const EntryEmbed({
    super.key,
    this.embedData,
    this.isOnlyForAdult = false,
    this.isNSFW = false,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<EntryEmbed> createState() => _EntryEmbedState();
}

class _EntryEmbedState extends State<EntryEmbed> with AutomaticKeepAliveClientMixin {

  bool hideAdult = false;

  @override
  void initState() {
    super.initState();
    hideAdult = true;
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

  void _onTap () {
    if ((widget.isOnlyForAdult || widget.isNSFW) && hideAdult) {
      setState(() {
        hideAdult = false;
      });
      return;
    }

    if (widget.onTap == null) {
      return;
    }
    widget.onTap!();
  }

  void _onLongPress () {
    if (widget.onLongPress == null) {
      return;
    }
    widget.onLongPress!();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    bool haveThumbnail = widget.embedData?.thumbnail == null ? false : true;
    String thumbnail = widget.embedData?.thumbnail ?? '';

    return GestureDetector(
      onTap: _onTap,
      onLongPress: _onLongPress,
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
                    color: _getColorByType(widget.embedData?.type ?? ''),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(_getLogoAssetPathByType(widget.embedData?.type ?? ''), width: Theme.of(context).textTheme.headlineMedium?.fontSize)
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
                              Icon(Icons.remove_red_eye_outlined),
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