import 'package:flutter/material.dart';
import 'package:openwykop/api/models/models.dart' as api_models;

class EntrySurvey extends StatefulWidget  {

  final api_models.Survey? surveyData;
  final Function(api_models.SurveyAnswer votedAnswer)? onVote;
  final VoidCallback? onLongPress;
  
  const EntrySurvey({
    super.key,
    this.surveyData,
    this.onVote,
    this.onLongPress,
  });

  @override
  State<EntrySurvey> createState() => _EntrySurveyState();
}

class _EntrySurveyState extends State<EntrySurvey> {

  Widget _getAnswerWidget (api_models.SurveyAnswer answer) {

    String text = answer.text ?? '';
    int precentage = ((answer.count ?? 1)/(widget.surveyData?.count ?? 1) * 100).toInt();
    bool isVoted = answer.voted == 1;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          if (widget.onVote == null) {
            return;
          }
          widget.onVote!(answer);
        },
        splashColor: isVoted ? Theme.of(context).colorScheme.primary.withAlpha(40) : Theme.of(context).colorScheme.secondary.withAlpha(40),
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: precentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isVoted ? Theme.of(context).colorScheme.primary.withAlpha(70) : Theme.of(context).colorScheme.secondary.withAlpha(70)
                        ),
                        height: double.infinity
                      )
                    ),
                    Expanded(
                      flex: 100-precentage,
                      child: Container(),
                    )
                  ],
                ),
              )
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: isVoted ? Border.all(width: 1, color: Theme.of(context).colorScheme.primary) : Border.all(width: 1, color: Theme.of(context).colorScheme.outline),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: isVoted ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface))
            )
          ],
        )
      )
    );
  }


  @override
  Widget build(BuildContext context) {

    String question = widget.surveyData?.question ?? '';

    if (widget.surveyData?.answers == null) {
      return Container();
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: () {
        if (widget.onLongPress == null) {
          return;
        }
        widget.onLongPress!();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(Icons.format_list_bulleted, size: Theme.of(context).textTheme.bodyMedium?.fontSize, color: Theme.of(context).textTheme.bodyMedium?.color)
                ),
                TextSpan(
                  text: ' $question',
                  style: Theme.of(context).textTheme.bodyMedium
                ),
              ]
            )
          ),
          ...widget.surveyData!.answers!.map((answer) {
            return _getAnswerWidget(answer);
          }),
        ],
      ),
    );
  }
}