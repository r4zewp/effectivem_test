import 'package:effectivem_test/feature/common/constants.dart';
import 'package:flutter/material.dart';

import 'icon_button_widget.dart';

PreferredSizeWidget? buildHomeAppBar(BuildContext context,
    {required String title}) {
  Size screenSize = MediaQuery.of(context).size;
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBarIconButton(
          onPressed: () {},
          iconUrl: 'assets/icons/location.svg',
          width: screenSize.width * (12 / Constants.propWidth),
          height: screenSize.height * (15.31 / Constants.propHeight),
          padding: EdgeInsets.only(
              right: screenSize.width * (11 / Constants.propWidth)),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
        AppBarIconButton(
          onPressed: () {},
          iconUrl: 'assets/icons/arrow_down.svg',
          width: screenSize.width * (10 / Constants.propWidth),
          height: screenSize.height * (5 / Constants.propHeight),
          padding: EdgeInsets.only(
              left: screenSize.width * (8 / Constants.propWidth)),
        ),
      ],
    ),
    automaticallyImplyLeading: false,
    centerTitle: true,
    actions: [
      AppBarIconButton(
        iconUrl: 'assets/icons/filter.svg',
        width: screenSize.width * (12 / Constants.propWidth),
        height: screenSize.height * (15.31 / Constants.propHeight),
        padding: EdgeInsets.only(
            right: screenSize.width * (15 / Constants.propWidth)),
        onPressed: () {},
      ),
    ],
  );
}
