import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/select_category/search_text_field/search_text_field_widget.dart';
import 'package:flutter/material.dart';

import '../category_slider/category_slider_widget.dart';
import 'title_widget.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: screenSize.width * (384 / Constants.propWidth),
          child: const TitleWidget(
            titleButtonText: Constants.viewAll,
            titleText: Constants.selectCategory,
          ),
        ),
        SizedBox(
          height: screenSize.height * (24 / Constants.propHeight),
        ),
        const CategorySliderWidget(
          categories: Constants.categories,
        ),
        SizedBox(
          height: screenSize.height * (35 / Constants.propHeight),
        ),
        SizedBox(
          width: screenSize.width * (345 / Constants.propWidth),
          child: const SearchTextField(),
        ),
      ],
    );
  }
}
