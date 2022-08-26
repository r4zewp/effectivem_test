import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * ((132 + 96 + 96) / Constants.propWidth),
      height: screenSize.height * (132 / Constants.propHeight),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: screenSize.height * (132 / Constants.propHeight),
            width: screenSize.width * (132 / Constants.propWidth),
            decoration: const BoxDecoration(
              color: AppColors.accentColor,
              shape: BoxShape.circle,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _buildText(screenSize),
          )
        ],
      ),
    );
  }

  Widget _buildText(Size screenSize) {
    return SizedBox(
      height: screenSize.height * (88 / Constants.propHeight),
      width: screenSize.width * (194 / Constants.propWidth),
      child: const Text(
        Constants.logoTitle,
        style: TextStyle(
          color: Colors.white,
          fontFamily: Constants.primaryFontFamily,
          fontWeight: FontWeight.w800,
          fontSize: 30,
        ),
      ),
    );
  }
}
