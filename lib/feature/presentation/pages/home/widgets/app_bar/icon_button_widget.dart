import 'package:flutter/material.dart';

import 'icon_widget.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    Key? key,
    required this.iconUrl,
    required this.onPressed,
    required this.width,
    required this.height,
    this.padding,
    this.color,
  }) : super(key: key);

  final String iconUrl;
  final VoidCallback? onPressed;
  final Color? color;
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: AppBarIconWidget(
        iconUrl: iconUrl,
        width: width,
        height: height,
        color: color,
        padding: padding ?? EdgeInsets.zero,
      ),
    );
  }
}
