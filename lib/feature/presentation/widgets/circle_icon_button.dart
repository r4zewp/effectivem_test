import 'package:effectivem_test/feature/presentation/pages/home/widgets/app_bar/icon_widget.dart';
import 'package:flutter/material.dart';

class CircleIconButton extends StatefulWidget {
  const CircleIconButton({
    Key? key,
    required this.iconUrl,
    required this.backgroundColor,
    required this.activeIconColor,
    required this.width,
    required this.height,
    required this.iconHeight,
    required this.iconWidth,
    this.disabledIconColor,
  }) : super(key: key);

  final String iconUrl;
  final Color backgroundColor;
  final Color activeIconColor;
  final Color? disabledIconColor;
  final double width;
  final double height;
  final double iconWidth;
  final double iconHeight;

  @override
  State<CircleIconButton> createState() => _CircleIconButtonState();
}

class _CircleIconButtonState extends State<CircleIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                shape: BoxShape.circle,
              ),
            ),
            AppBarIconWidget(
              iconUrl: widget.iconUrl,
              color: widget.activeIconColor,
              width: widget.iconWidth,
              height: widget.iconHeight,
            ),
          ],
        ),
      ),
    );
  }
}
