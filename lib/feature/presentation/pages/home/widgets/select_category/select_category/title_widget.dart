import 'package:effectivem_test/feature/common/constants.dart';
import 'package:flutter/material.dart';

import 'text_button_widget.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.titleButtonText,
    required this.titleText,
  }) : super(key: key);

  final String titleButtonText;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: Theme.of(context).textTheme.headline1,
        ),
        SCTextButtonWidget(
          buttonTitle: titleButtonText,
          onPressed: () {},
        ),
      ],
    );
  }
}
