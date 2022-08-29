import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/app_bar/icon_widget.dart';
import 'package:effectivem_test/feature/presentation/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';

class CircleIconButtonActive extends CircleIconButton {
  const CircleIconButtonActive({
    Key? key,
    required super.iconUrl,
    required super.backgroundColor,
    required super.activeIconColor,
    required super.width,
    required super.height,
    required super.iconHeight,
    required super.iconWidth,
    required this.activeIconUrl,
    required this.boxShadow,
  }) : super(key: key);

  final List<BoxShadow> boxShadow;
  final String activeIconUrl;

  @override
  State<CircleIconButtonActive> createState() => _CircleIconButtonActiveState();
}

class _CircleIconButtonActiveState extends State<CircleIconButtonActive> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isActive = !isActive);
      },
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
                boxShadow: widget.boxShadow,
              ),
            ),
            AnimatedCrossFade(
              firstChild: AppBarIconWidget(
                iconUrl: widget.iconUrl,
                color: widget.activeIconColor,
                width: widget.iconWidth,
                height: widget.iconHeight,
              ),
              secondChild: AppBarIconWidget(
                iconUrl: widget.activeIconUrl,
                color: widget.activeIconColor,
                width: widget.iconWidth,
                height: widget.iconHeight,
              ),
              crossFadeState: isActive
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Constants.primaryDuration,
            ),
          ],
        ),
      ),
    );
  }
}
