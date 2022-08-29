import 'package:effectivem_test/feature/common/colors.dart';
import 'package:flutter/material.dart';

class SCTextButtonWidget extends StatelessWidget {
  const SCTextButtonWidget({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);

  final String buttonTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onPressed ?? () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          splashFactory: NoSplash.splashFactory,
          primary: AppColors.scaffoldBackgroundColor,
        ),
        child: Text(
          buttonTitle,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
