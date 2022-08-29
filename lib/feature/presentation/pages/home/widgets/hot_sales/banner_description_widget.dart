import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';

import 'banner_button_widget.dart';

class BannerDescription extends StatelessWidget {
  const BannerDescription({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenSize.width * (25 / Constants.propWidth),
      ),
      child: SizedBox(
        width: screenSize.width * (145 / Constants.propWidth),
        child: Padding(
          padding: EdgeInsets.only(
            top: screenSize.height * (23 / Constants.propHeight),
            bottom: screenSize.height * (26 / Constants.propHeight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Proportions are same with figma.
              /// Still looks strange.
              CircleIconButton(
                iconUrl: 'assets/icons/new.svg',
                backgroundColor: AppColors.accentColor,
                activeIconColor: Colors.white,
                width: screenSize.width * (27 / Constants.propWidth),
                height: screenSize.height * (27 / Constants.propHeight),
                iconHeight: 12,
                iconWidth: 20,
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                "Iphone 12",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: screenSize.height * (5 / Constants.propHeight),
              ),
              const Text(
                "Súper. Mega. Rápido.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              BannerButton(
                title: Constants.buyNow,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
