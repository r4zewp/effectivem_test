import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/bottom_nav_bar/custom_bottom_nb_item.dart';
import 'package:flutter/material.dart';

Widget buildNavBar(
  Size screenSize, {
  required int curIndex,
  required void Function(int index) updateindex,
}) {
  return Container(
    alignment: Alignment.centerLeft,
    width: double.infinity,
    height: screenSize.height * (72 / Constants.propHeight),
    decoration: const BoxDecoration(
      color: AppColors.secondaryBackgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          4,
          (index) => GestureDetector(
            onTap: () {
              updateindex(index);
            },
            child: CustomBottomNavBarItem(
              iconUrl: Constants.bottomNavBarItems.values.toList()[index],
              name: Constants.bottomNavBarItems.keys.toList()[index],
              isActive: index == curIndex ? true : false,
            ),
          ),
        ),
      ],
    ),
  );
}
