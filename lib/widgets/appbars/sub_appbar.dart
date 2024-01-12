import 'package:flutter/material.dart';

class SubAppbar extends StatelessWidget {

  final List<Widget>? leftSideButtons;
  final List<Widget>? rightSideButtons;

  const SubAppbar({
    super.key,
    this.leftSideButtons,
    this.rightSideButtons
  });

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: viewportConstraints.maxWidth,
            ),
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 2, right: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (leftSideButtons != null)
                      Row(
                        children: leftSideButtons!
                      ),
                    if (rightSideButtons != null)
                      Row(
                        children: rightSideButtons!
                      ),
                  ]
                ),
              )
            ),
          )
        );
      }
    );
  }
}