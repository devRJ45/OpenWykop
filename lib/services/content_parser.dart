class ContentParser {
  
  static TextSegment parse (String content) {
    return _parseSegment(TextSegment(
      type: 'normal',
      text: content
    ));
  }

  static List<IPattern> patterns = [
    PatternCodeBlock(),
    PatternSpoiler(),
    PatternQuote(),
    PatternCode(),
    PatternItalic(),
    PatternBold(),
    PatternLink(),
    PatternRawLink(),
    PatternUsername(),
    PatternTag(),
  ];

  static TextSegment _parseSegment (TextSegment segment, {List<String>? segmentParentStyles}) {

    String originalType = segment.type;
    List<TextSegment> childrens = [];

    if (segment.endParsing) {
      return segment;
    }

    if (segment.text != null) {
      while (true) {
        PatternMatch? bestMatch;
        
        for (IPattern patt in patterns) {
          PatternMatch? match = patt.findFirst(segment.text!); 
          if (match == null) {
            continue;
          }

          bestMatch ??= match;

          if (match.start < bestMatch.start) {
            bestMatch = match;
          }
        }

        if (bestMatch == null) {
          
          if (childrens.isEmpty) {
            return TextSegment(type: originalType, text: segment.text!, endParsing: true, parentStyles: segmentParentStyles);
          }

          if (segment.text!.isNotEmpty) {
            childrens.add(TextSegment(type: originalType, text: segment.text!, parentStyles: segmentParentStyles));
          }

          segment.text = null;
          segment.children = childrens;

          return _parseSegment(segment, segmentParentStyles: segmentParentStyles);
        }

        if (bestMatch.start > 0) {
          childrens.add(TextSegment(type: originalType, text: segment.text!.substring(0, bestMatch.start), parentStyles: segmentParentStyles));
        }

        List<String>? parentStyles;
        if (segmentParentStyles != null) {
          parentStyles = [...segmentParentStyles];
        }
        parentStyles ??= [];
        parentStyles.add(bestMatch.patternName);

        if (bestMatch.placeInSubBlock != null) {
          childrens.add(TextSegment(
            type: bestMatch.patternName,
            parentStyles: parentStyles,
            children: [
              TextSegment(type: bestMatch.placeInSubBlock!, text: bestMatch.value, rawValue: bestMatch.rawValue, endParsing: bestMatch.forceEndParsing, parentStyles: parentStyles)
            ]
          ));
        } else {
          childrens.add(TextSegment(type: bestMatch.patternName, text: bestMatch.value, rawValue: bestMatch.rawValue, endParsing: bestMatch.forceEndParsing, parentStyles: parentStyles));
        }

        segment.text = segment.text!.substring(bestMatch.end, segment.text!.length);
      }
    } else if (segment.children != null) {
      segment.children = segment.children!.map((seg) {
        return _parseSegment(seg, segmentParentStyles: seg.parentStyles);
      }).toList();
    }

    return segment;
  }
}

class TextSegment {
  String type;
  String? text;
  String? rawValue;
  List<TextSegment>? children;
  bool endParsing;
  List<String>? parentStyles;

  TextSegment({
    this.type = 'normal',
    this.text,
    this.rawValue,
    this.children,
    this.endParsing = false,
    this.parentStyles
  });

}

class PatternMatch {
  String patternName;
  int start;
  int end;
  String value;
  String rawValue;
  bool forceEndParsing;
  String? placeInSubBlock;

  PatternMatch(
    this.patternName,
    this.start,
    this.end,
    this.value,
    this.rawValue,
    {
      this.forceEndParsing = false,
      this.placeInSubBlock
    }
  );
}

abstract class IPattern {
  final String name;

  IPattern(this.name);

  PatternMatch? findFirst(String content);
}

class PatternCodeBlock extends IPattern {
  
  PatternCodeBlock() : super('codeblock');

  RegExp startRegExp = RegExp(r'^\`(\n?)', multiLine: true);
  RegExp endRegExp = RegExp(r'(\n)?\`$', multiLine: true);

  @override
  PatternMatch? findFirst(String content) {
    RegExpMatch? startMatch = startRegExp.firstMatch(content);

    if (startMatch == null) {
      return null;
    }

    RegExpMatch? endMatch = endRegExp.firstMatch(content.substring(startMatch.end));

    if (endMatch == null) {
      return null;
    }

    int rawStart = startMatch.start;
    int rawEnd = endMatch.end + startMatch.end;

    String value = content.substring(startMatch.end, endMatch.start+startMatch.end);
    String rawValue = content.substring(rawStart, rawEnd);

    return PatternMatch(name, rawStart, rawEnd, value, rawValue, forceEndParsing: true, placeInSubBlock: 'codeblock-text');
  }

}

class PatternQuote extends IPattern {
  
  PatternQuote() : super('quote');

  RegExp quoteLineRegExp = RegExp(r'^\s?>(.*)$', multiLine: true);

  @override
  PatternMatch? findFirst(String content) {
    Iterable<RegExpMatch> matches = quoteLineRegExp.allMatches(content);

    RegExpMatch? firstMatch;
    RegExpMatch? lastMatch;

    for (RegExpMatch m in matches) {
      firstMatch ??= m;
      lastMatch ??= m;

      if (firstMatch.end+1 == m.start) {
        lastMatch = m;
      }
    }


    if (firstMatch == null || lastMatch == null) {
      return null;
    }

    int start = firstMatch.start;
    int end = lastMatch.end;

    String value = content.substring(start, end).replaceAllMapped(quoteLineRegExp, (match) => match.group(1)!);
    String rawValue = content.substring(start, end);

    return PatternMatch(name, start, end, value, rawValue, placeInSubBlock: 'quote-text');
  }

}

class PatternSpoiler extends IPattern {
  
  PatternSpoiler() : super('spoiler');

  RegExp quoteLineRegExp = RegExp(r'^\!(.*)$', multiLine: true);

  @override
  PatternMatch? findFirst(String content) {
    Iterable<RegExpMatch> matches = quoteLineRegExp.allMatches(content);

    RegExpMatch? firstMatch;
    RegExpMatch? lastMatch;

    for (RegExpMatch m in matches) {
      firstMatch ??= m;
      lastMatch ??= m;

      if (firstMatch.end+1 == m.start) {
        lastMatch = m;
      }
    }


    if (firstMatch == null || lastMatch == null) {
      return null;
    }

    int start = firstMatch.start;
    int end = lastMatch.end;

    String value = content.substring(start, end).replaceAllMapped(quoteLineRegExp, (match) => match.group(1)!);
    String rawValue = content.substring(start, end);

    return PatternMatch(name, start, end, value, rawValue, placeInSubBlock: 'spoiler-text');
  }

}

class PatternCode extends IPattern {
  
  PatternCode() : super('code');

  @override
  PatternMatch? findFirst(String content) {
    int start = content.indexOf('`');
    
    if (start < 0) {
      return null;
    }

    int end = content.indexOf('`', start+1);

    if (end < 0) {
      return null;
    }

    end += 1;

    String value = content.substring(start+1, end-1);
    String rawValue = content.substring(start, end);

    return PatternMatch(name, start, end, value, rawValue, forceEndParsing: true);
  }

}

class PatternBold extends IPattern {
  
  PatternBold() : super('bold');

  @override
  PatternMatch? findFirst(String content) {
    int start = content.indexOf('**');
    
    if (start < 0) {
      return null;
    }

    int end = content.indexOf('**', start+2);

    if (end < 0) {
      return null;
    }

    end += 2;

    String value = content.substring(start+2, end-2);
    String rawValue = content.substring(start, end);

    return PatternMatch(name, start, end, value, rawValue);
  }

}

class PatternItalic extends IPattern {
  
  PatternItalic() : super('italic');

  @override
  PatternMatch? findFirst(String content) {
    int start = content.indexOf('_');
    
    if (start < 0) {
      return null;
    }

    int end = content.indexOf('_', start+1);

    if (end < 0) {
      return null;
    }

    end += 1;

    String value = content.substring(start+1, end-1);
    String rawValue = content.substring(start, end);

    return PatternMatch(name, start, end, value, rawValue);
  }

}

class PatternLink extends IPattern {
  
  PatternLink() : super('link');

  @override
  PatternMatch? findFirst(String content) {
    int start = content.indexOf('[');
    
    if (start < 0) {
      return null;
    }

    int middle = content.indexOf('](', start+1);

    if (middle < 0) {
      return null;
    }

    int end = content.indexOf(')', middle+2);

    if (end < 0) {
      return null;
    }

    end += 1;

    String value = content.substring(start+1, middle);
    String rawValue = content.substring(start, end);

    return PatternMatch(name, start, end, value, rawValue);
  }

}

class PatternRawLink extends IPattern {
  
  PatternRawLink() : super('link');

  RegExp linkRegExp = RegExp(r'(https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*))', multiLine: true);

  @override
  PatternMatch? findFirst(String content) {
    RegExpMatch? match = linkRegExp.firstMatch(content);

    if (match == null) {
      return null;
    }

    int start = match.start;
    int end = match.end;

    String rawValue = content.substring(start, end);

    return PatternMatch(name, start, end, rawValue, rawValue, forceEndParsing: true);
  }

}

class PatternUsername extends IPattern {
  
  PatternUsername() : super('username');

  RegExp usernameRegExp = RegExp(r'(^| )@([\w\d\-]*)', multiLine: true);

  @override
  PatternMatch? findFirst(String content) {
    RegExpMatch? match = usernameRegExp.firstMatch(content);

    if (match == null) {
      return null;
    }

    int start = match.start + match.group(1)!.length;
    int end = match.end;

    String value = match.group(2)!;
    String rawValue = content.substring(start, end);

    return PatternMatch(name, start, end, value, rawValue);
  }

}

class PatternTag extends IPattern {
  
  PatternTag() : super('tag');

  RegExp usernameRegExp = RegExp(r'(^| )#([a-zA-Z\d]*)', multiLine: true);

  @override
  PatternMatch? findFirst(String content) {
    RegExpMatch? match = usernameRegExp.firstMatch(content);

    if (match == null) {
      return null;
    }

    int start = match.start + match.group(1)!.length;
    int end = match.end;

    String value = match.group(2)!;
    String rawValue = content.substring(start, end);

    return PatternMatch(name, start, end, value, rawValue);
  }

}