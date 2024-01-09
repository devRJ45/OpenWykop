import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;
import 'package:openwykop/widgets/widgets.dart';

class EntryStreamItem extends StatelessWidget {

  final api_models.Entry entryData;

  const EntryStreamItem({
    super.key,
    required this.entryData,
  });

  List<Widget> _buildContentWidgets () {
    List<Widget> widgets = [];

    bool haveContent = entryData.content != null && entryData.content!.isNotEmpty;
    bool havePhoto = entryData.media?.photo != null;
    bool haveEmbed = entryData.media?.embed != null;
    bool haveSurvey = entryData.media?.survey != null;

    bool isOnlyForAdult = entryData.adult ?? false;
    bool isNSFW = (entryData.content ?? '').contains('#nsfw');

    if (haveContent) {
      widgets.add(Container(
        alignment: Alignment.topLeft,
        child: ContentBody(content: entryData.content!),
      ));
    }

    if (havePhoto) {
      widgets.add(EntryPhoto(photoData: entryData.media!.photo, isOnlyForAdult: isOnlyForAdult, isNSFW: isNSFW));
    }

    if (haveEmbed) {
      widgets.add(EntryEmbed(embedData: entryData.media!.embed));
    }

    if (haveSurvey) {
      widgets.add(EntrySurvey(surveyData: entryData.media!.survey));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          EntryHeader(userData: entryData.author, entryCreatedAt: entryData.createdAt),
          ..._buildContentWidgets().map((e) => Padding(
            padding: const EdgeInsets.only(top: 5),
            child: e,
          )).toList(),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: EntryActions(entryData: entryData),
          ),
        ]
      )
    );
  }
}