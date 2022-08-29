import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/select_category/category_slider/category_item_widget.dart';
import 'package:flutter/material.dart';

class CategorySliderWidget extends StatefulWidget {
  const CategorySliderWidget({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final Map<String, String> categories;

  @override
  State<CategorySliderWidget> createState() => _CategorySliderWidgetState();
}

class _CategorySliderWidgetState extends State<CategorySliderWidget> {
  final ScrollController _scrlCtrl = ScrollController();
  int currentCategoryIndex = 0;

  /// Updating current category.
  void updateIndex(int givenIndex) {
    setState(() {
      currentCategoryIndex = givenIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoriesToShow = widget.categories;

    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * (110 / Constants.propHeight),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(
                left: screenSize.width * (27 / Constants.propWidth),
              ),
              scrollDirection: Axis.horizontal,
              itemCount: categoriesToShow.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CategoryItem(
                  name: categoriesToShow.keys.toList()[index],
                  icon: categoriesToShow.values.toList()[index],
                  isActive: currentCategoryIndex == index ? true : false,
                  updateIndex: (index) => updateIndex(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
