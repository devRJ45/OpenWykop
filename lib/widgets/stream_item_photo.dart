import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;

class StreamItemPhoto extends StatefulWidget  {
  
  final api_models.Photo? photoData;
  final bool isOnlyForAdult;
  final bool isNSFW;
  final VoidCallback? onTapPhoto;
  final VoidCallback? onLongPressPhoto;

  final double maxAspectRatioWithoutCollapsed = 10/8;
  
  const StreamItemPhoto({
    super.key,
    this.photoData,
    this.isOnlyForAdult = false,
    this.isNSFW = false,
    this.onTapPhoto,
    this.onLongPressPhoto,
  });

  @override
  State<StreamItemPhoto> createState() => _StreamItemPhotoState();
}

class _StreamItemPhotoState extends State<StreamItemPhoto> with AutomaticKeepAliveClientMixin {

  double originalAspectRatio = 1;
  bool isCollapsed = true;
  bool isGif = false;
  bool hideAdult = true;
  String thumbnailUrl = '';

  @override
  void initState() {
    super.initState();
    originalAspectRatio = (widget.photoData?.width ?? 1)/(widget.photoData?.height ?? 1);
    isCollapsed = originalAspectRatio < widget.maxAspectRatioWithoutCollapsed;
    isGif = widget.photoData?.url?.contains('.gif') ?? false;
    hideAdult = true;
    thumbnailUrl = widget.photoData?.getThumbnailUrl() ?? '';
  }

  void _onTapImage () {
    if ((widget.isOnlyForAdult || widget.isNSFW) && hideAdult) {
      setState(() {
        hideAdult = false;
      });
      return;
    }

    if (isCollapsed) {
      setState(() {
        isCollapsed = false;
      });
      return;
    }

    if (widget.onTapPhoto == null) {
      return;
    }
    widget.onTapPhoto!();
  }

  void _onLongPressImage () {
    if (widget.onLongPressPhoto == null) {
      return;
    }
    widget.onLongPressPhoto!();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.photoData?.width == null || widget.photoData?.height == null) {
      return Container();
    }

    return GestureDetector(
      onTap: _onTapImage,
      onLongPress: _onLongPressImage,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: AspectRatio(
          aspectRatio: isCollapsed ? widget.maxAspectRatioWithoutCollapsed : originalAspectRatio,
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
              Visibility(
                visible: isCollapsed,
                child: Positioned.fill(
                  bottom: -1,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Wrap(
                      children: [
                        Container(
                          color: Theme.of(context).colorScheme.surfaceVariant.withAlpha(200),
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text("Tapnij aby rozwinąć", style: Theme.of(context).textTheme.labelMedium)
                        )
                      ],
                    )
                  )
                ),
              ),
              if (isGif)
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    child: Card(
                      color: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(Icons.gif, color: Theme.of(context).colorScheme.onPrimary),
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