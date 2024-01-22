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
        case 'link':
          style = style!.copyWith(color: Theme.of(context).colorScheme.primary);
          continue;
        case 'code':
          style = style!.copyWith(backgroundColor: Theme.of(context).colorScheme.surfaceVariant, color: Theme.of(context).colorScheme.onSurfaceVariant, fontFamily: 'monospace');
          continue;
        case 'username':
          style = style!.copyWith(color: Theme.of(context).colorScheme.primary);
          continue;
        case 'tag':
          style = style!.copyWith(color: Theme.of(context).colorScheme.primary);
          continue;
      }
    }

    return style!;
  }

  InlineSpan _buildTextWidget (BuildContext context, TextSegment segment, TextStyle parentStyle) {
    TextStyle segmentStyle = _combineStyleWithParentStyles(parentStyle, segment.parentStyles);

    switch (segment.type) {
      case 'bold':
      case 'italic':
      case 'link':
      case 'code':
      case 'codeblock':
        return TextSpan(
          text: segment.text,
          style: segmentStyle
        );
        
      case 'username':
        return TextSpan(
          style: segmentStyle,
          children: [
            TextSpan(
              text: '@',
              style: segmentStyle.copyWith(color: parentStyle.color)
            ),
            TextSpan(
              text: segment.text,
            )
          ]
        );

      case 'tag':
        return TextSpan(
          style: segmentStyle,
          children: [
            TextSpan(
              text: '#',
              style: segmentStyle.copyWith(color: parentStyle.color)
            ),
            TextSpan(
              text: segment.text,
            )
          ]
        );
    }
    return TextSpan(
      style: segmentStyle,
      text: segment.text, 
    );
  }

  InlineSpan _buildWidgetWithChildrens (BuildContext context, TextSegment segment, TextStyle parentStyle) {
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
                  style: _combineStyleWithParentStyles(parentStyle.copyWith(fontFamily: 'monospace', color: Theme.of(context).colorScheme.onSurfaceVariant), segment.parentStyles),
                  children: segment.children!.map((seg) {
                    return _buildContent(context, seg, parentStyle);
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
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              child: RichText(
                text: TextSpan(
                  style: _combineStyleWithParentStyles(parentStyle.copyWith(fontStyle: FontStyle.italic), segment.parentStyles),
                  children: segment.children!.map((seg) {
                    return _buildContent(context, seg, parentStyle);
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
                  style: _combineStyleWithParentStyles(parentStyle.copyWith(fontFamily: 'monospace'), segment.parentStyles),
                  children: segment.children!.map((seg) {
                    return _buildContent(context, seg, parentStyle);
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
        return _buildContent(context, seg, parentStyle);
      }).toList(),
    );
  }

  InlineSpan _buildContent (BuildContext context, TextSegment segment, TextStyle parentStyle) {
    
    if (segment.text != null) {
      return _buildTextWidget(context, segment, parentStyle);
    }

    if (segment.children != null) {
      return _buildWidgetWithChildrens(context, segment, parentStyle);
    }

    return const TextSpan();
  }

  @override
  Widget build(BuildContext context) {

    TextSegment segment = ContentParser.parse(widget.content);

    return RichText(
      text: TextSpan(
        children: [
          _buildContent(context, segment, Theme.of(context).textTheme.bodyMedium ?? const TextStyle())
        ]
      )
    );
  }

}