import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/hot_sales/banner_description_widget.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * (384 / Constants.propWidth),
      height: screenSize.height * (182 / Constants.propHeight),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.bannerBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BannerDescription(
              screenSize: screenSize,
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 238,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/img/banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
