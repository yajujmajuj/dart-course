import 'package:flutter/material.dart';
import 'package:healthandwellness/res/components/app_text.dart';

class FloatButton extends StatelessWidget {
  final AppText floatLabel;
  final Widget floatIcon;
  final VoidCallback onPressed;

  const FloatButton({
    Key? key,
    required this.floatLabel,
    required this.floatIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: floatLabel,
      icon: floatIcon,
      isExtended: true,
      onPressed: onPressed,
    );
  }
}
