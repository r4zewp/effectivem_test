import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/hot_sales/banner_widget.dart';
import 'package:flutter/material.dart';

import '../select_category/select_category/title_widget.dart';

class HotSalesWidget extends StatelessWidget {
  const HotSalesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: screenSize.width * (384 / Constants.propWidth),
          child: const TitleWidget(
            titleButtonText: Constants.seeMore,
            titleText: Constants.hotSales,
          ),
        ),
        SizedBox(
          height: screenSize.height * (8 / Constants.propHeight),
        ),
        const BannerWidget(),
      ],
    );
  }
}
