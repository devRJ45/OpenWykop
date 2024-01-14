import 'package:flutter/material.dart';

class SubAppbarButton extends StatelessWidget {

  final String label;
  final bool isActive;
  final bool isDropdown;
  final VoidCallback? onTap;

  const SubAppbarButton({
    super.key,
    required this.label,
    this.isActive = false,
    this.isDropdown = false,
    this.onTap
  });

  void _onTap () {
    if (onTap == null) {
      return;
    }
    onTap!();
  }

  @override
  Widget build(BuildContext context) {
    Color outlineColor = isActive ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline;
    Color splashColor = outlineColor.withAlpha(40);
    Color? fontColor = isActive ? Theme.of(context).colorScheme.primary : Theme.of(context).textTheme.labelLarge?.color;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: InkWell(
        onTap: _onTap,
        splashColor: splashColor,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: outlineColor,
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(label, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: fontColor)),
              if (isDropdown)
                Icon(Icons.arrow_drop_down, size: (Theme.of(context).textTheme.labelLarge?.fontSize ?? 11) * 1.3, color: fontColor)
            ],
          )
        )
      ),
    );
  }
}