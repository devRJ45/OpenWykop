import 'package:flutter/material.dart';
import 'package:openwykop/services/content_parser.dart';

import 'widgets.dart';

class ContentBody extends StatefulWidget {
  
  final String content;
  
  const ContentBody({
    super.key,
    required this.content
  });

  @override
  State<ContentBody> createState() => _ContentBodyState();
}

class _ContentBodyState extends State<ContentBody> {

  TextStyle _combineStyleWithParentStyles (TextStyle? style, [List<String>? parentStyles]) {
    style ??= const TextStyle();

    if (parentStyles == null) {
      return style;
    }

    for (String styleName in parentStyles) {
      switch (styleName) {
        case 'bold':
          style = style!.copyWith(fontWeight: FontWeight.bold);
          continue;
        case 'italic':
          style = style!.copyWith(fontStyle: FontStyle.italic);
          continue;
      }
    }

    return style!;
  }

   TextStyle? _getTextStyleByName (String styleName) {
    switch (styleName) {
      case 'bold':
        return const TextStyle(fontWeight: FontWeight.bold);
      case 'italic':
        return const TextStyle(fontStyle: FontStyle.italic);
      case 'link':
        return TextStyle(color: Theme.of(context).colorScheme.primary);
      case 'code':
        return TextStyle(backgroundColor: Theme.of(context).colorScheme.surfaceVariant, color: Theme.of(context).colorScheme.onSurfaceVariant, fontFamily: 'monospace');
      case 'username':
        return const TextStyle(color: Colors.green);
      case 'tag':
        return const TextStyle(color: Colors.amber);
      default:
        return DefaultTextStyle.of(context).style;
    }
  }

  InlineSpan _buildTextWidget (BuildContext context, TextSegment segment) {
    switch (segment.type) {
      case 'bold':
      case 'italic':
      case 'link':
      case 'code':
      case 'codeblock':
        return TextSpan(
          text: segment.text,
          style: _getTextStyleByName(segment.type)
        );
        
      case 'username':
        return TextSpan(
          children: [
            const TextSpan(
              text: '@'
            ),
            TextSpan(
              text: segment.text,
              style:TextStyle(color: Theme.of(context).colorScheme.primary),
            )
          ]
        );

      case 'tag':
        return TextSpan(
          children: [
            const TextSpan(
              text: '#'
            ),
            TextSpan(
              text: segment.text,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            )
          ]
        );
    }
    return TextSpan(
      text: segment.text, 
    );
  }

  InlineSpan _buildWidgetWithChildrens (BuildContext context, TextSegment segment) {
    switch (segment.type) {
      case 'codeblock':
        return WidgetSpan(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: Theme.of(context).colorScheme.outline),
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              child: RichText(
                text: TextSpan(
                  style: _combineStyleWithParentStyles(Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: 'monospace', color: Theme.of(context).colorScheme.onSurfaceVariant), segment.parentStyles),
                  children: segment.children!.map((seg) {
                    return _buildContent(context, seg);
                  }).toList(),
                )
              )
            ),
          )
        );

      case 'quote':
        return WidgetSpan(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: Theme.of(context).colorScheme.outline),
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              child: RichText(
                text: TextSpan(
                  style: _combineStyleWithParentStyles(Theme.of(context).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic), segment.parentStyles),
                  children: segment.children!.map((seg) {
                    return _buildContent(context, seg);
                  }).toList(),
                )
              )
            ),
          )
        );

      case 'spoiler':
        return WidgetSpan(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextSpoiler(
              content: RichText(
                text: TextSpan(
                  style: _combineStyleWithParentStyles(Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: 'monospace'), segment.parentStyles),
                  children: segment.children!.map((seg) {
                    return _buildContent(context, seg);
                  }).toList(),
                )
              ),
              spoilerText: 'Pokaż spoiler',
            ),
          ),
        );
    }

    return TextSpan(
      children: segment.children!.map((seg) {
        return _buildContent(context, seg);
      }).toList(),
    );
  }

  InlineSpan _buildContent (BuildContext context, TextSegment segment) {
    
    if (segment.text != null) {
      return _buildTextWidget(context, segment);
    }

    if (segment.children != null) {
      return _buildWidgetWithChildrens(context, segment);
    }

    return const TextSpan();
  }

  @override
  Widget build(BuildContext context) {

    TextSegment segment = ContentParser.parse(widget.content);

    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          _buildContent(context, segment)
        ]
      )
    );
  }

}