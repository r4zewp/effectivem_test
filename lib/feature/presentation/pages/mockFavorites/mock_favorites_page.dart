import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Mock favorites page :)",
        style: TextStyle(
          fontFamily: Constants.primaryFontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.secondaryBackgroundColor,
        ),
      ),
    );
  }
}
