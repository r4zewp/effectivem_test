import 'package:effectivem_test/feature/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarIconWidget extends StatelessWidget {
  const AppBarIconWidget({
    Key? key,
    required this.iconUrl,
    this.width,
    this.height,
    this.color,
    this.padding,
  }) : super(key: key);

  final String iconUrl;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SvgPicture.asset(
        iconUrl,
        width: width,
        height: height,
      ),
    );
  }
}
