import 'package:flutter/material.dart';

class TextSpoiler extends StatefulWidget  {
  
  final String spoilerText;
  final RichText content;
  
  const TextSpoiler({
    super.key,
    required this.spoilerText,
    required this.content,
  });

  @override
  State<TextSpoiler> createState() => _TextSpoilerState();
}

class _TextSpoilerState extends State<TextSpoiler> {

  bool isCollapsed = true;

  void toggleVisibility () {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    if (isCollapsed) {
      return InkWell(
        onTap: toggleVisibility,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.surfaceVariant,
          ),
          child: Text(widget.spoilerText, textScaleFactor: 0.9, style: Theme.of(context).textTheme.bodyMedium)
        )
      );
    }
    return SizedBox(
      width: double.infinity,
      child: widget.content
    );
  }
}



