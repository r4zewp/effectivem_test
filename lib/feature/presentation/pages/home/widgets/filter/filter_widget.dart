import 'dart:io';

import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/filter/icon_rounded_button.dart';
import 'package:flutter/material.dart';

buildCustomModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    barrierColor: Colors.transparent,
    elevation: 0.0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) {
      Size screenSize = MediaQuery.of(context).size;
      return Padding(
        padding: EdgeInsets.only(
            top: screenSize.height * (24 / Constants.propHeight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenSize.height * (375 / Constants.propHeight),
              width: screenSize.width * (350 / Constants.propWidth),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Text(
                        Constants.filterOptions,
                        style: TextStyle(
                          color: AppColors.newPriceColor,
                          fontFamily: Constants.primaryFontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedIconButton(
                            width:
                                screenSize.width * (37 / Constants.propWidth),
                            height:
                                screenSize.height * (37 / Constants.propHeight),
                            backgroundColor: AppColors.secondaryBackgroundColor,
                            iconUrl: 'assets/icons/exit.svg',
                            iconHeight: 10,
                            iconWidth: 11,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          RoundedIconButton(
                            width:
                                screenSize.width * (86 / Constants.propWidth),
                            height:
                                screenSize.height * 37 / Constants.propHeight,
                            backgroundColor: AppColors.accentColor,
                            onPressed: () {},
                            buttonText: const Text(
                              Constants.done,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: Constants.primaryFontFamily,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
