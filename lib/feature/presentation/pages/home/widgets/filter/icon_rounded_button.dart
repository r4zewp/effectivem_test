import 'package:effectivem_test/feature/presentation/pages/home/widgets/app_bar/icon_widget.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.onPressed,
    this.iconColor,
    this.buttonText,
    this.iconUrl,
    this.iconHeight,
    this.iconWidth,
  }) : super(key: key);

  final double width;
  final double height;
  final Color backgroundColor;
  final Color? iconColor;
  final Text? buttonText;
  final String? iconUrl;
  final double? iconWidth;
  final double? iconHeight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    assert(iconUrl != null || buttonText != null, "Set either icon or text");
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: buttonText == null
              ? Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: AppBarIconWidget(
                        iconUrl: iconUrl!,
                        color: iconColor ?? Colors.white,
                        width: iconWidth,
                        height: iconHeight,
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    buttonText!,
                  ],
                ),
        ),
      ),
    );
  }
}
