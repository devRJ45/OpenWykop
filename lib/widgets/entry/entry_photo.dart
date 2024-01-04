import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;

class EntryPhoto extends StatefulWidget  {
  
  final api_models.Photo? photoData;
  final VoidCallback? onTapPhoto;
  final VoidCallback? onLongPressPhoto;

  final double ellapsedAspectRatio = 16/9;
  
  const EntryPhoto({
    super.key,
    this.photoData,
    this.onTapPhoto,
    this.onLongPressPhoto,
  });

  @override
  State<EntryPhoto> createState() => _EntryPhotoState();
}

class _EntryPhotoState extends State<EntryPhoto> {

  double originalAspectRatio = 1;
  bool isEllapsed = true;

  @override
  void initState() {
    super.initState();
    originalAspectRatio = (widget.photoData?.width ?? 1)/(widget.photoData?.height ?? 1);
    isEllapsed = originalAspectRatio < widget.ellapsedAspectRatio;
  }

  void _onTapImage () {
    if (isEllapsed) {
      setState(() {
        isEllapsed = false;
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

    if (widget.photoData?.width == null || widget.photoData?.height == null) {
      return Container();
    }

    String photoUrl = widget.photoData?.getThumbnailUrl() ?? '';

    return GestureDetector(
      onTap: _onTapImage,
      onLongPress: _onLongPressImage,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: AspectRatio(
          aspectRatio: isEllapsed ? widget.ellapsedAspectRatio : originalAspectRatio,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: photoUrl,
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
                  child: const CircularProgressIndicator()
                ),
                errorWidget: (context, url, error) => Container(
                  alignment: Alignment.center,
                  child: const Icon(Icons.no_photography_outlined)
                ),
              ),
              Visibility(
                visible: isEllapsed,
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
              )
            ]
          ),
        )
      ),
    );
  }
}