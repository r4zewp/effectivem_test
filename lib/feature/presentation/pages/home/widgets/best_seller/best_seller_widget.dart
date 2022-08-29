import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/best_seller/phones_grid_widget.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/select_category/select_category/title_widget.dart';
import 'package:flutter/material.dart';

class BestsellerWidget extends StatelessWidget {
  const BestsellerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: screenSize.width * (384 / Constants.propWidth),
          child: const TitleWidget(
            titleButtonText: Constants.seeMore,
            titleText: Constants.bestSeller,
          ),
        ),
        SizedBox(
          height: screenSize.height * (8 / Constants.propHeight),
        ),
        SizedBox(
          width: screenSize.width * (384 / Constants.propWidth),
          child: const PhonesGridWidget(),
        ),
      ],
    );
  }
}
