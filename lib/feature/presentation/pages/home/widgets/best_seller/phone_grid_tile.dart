import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/domain/entities/phone_entity.dart';
import 'package:effectivem_test/feature/presentation/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';

class PhoneGridTile extends StatefulWidget {
  const PhoneGridTile({Key? key, this.phone}) : super(key: key);

  final PhoneEntity? phone;

  @override
  State<PhoneGridTile> createState() => _PhoneGridTileState();
}

class _PhoneGridTileState extends State<PhoneGridTile> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * (181 / Constants.propWidth),
      height: screenSize.height * (227 / Constants.propHeight),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(),
                CircleIconButton(
                  iconUrl: 'assets/icons/heart.svg',
                  backgroundColor: Colors.white,
                  activeIconColor: AppColors.accentColor,
                  width: screenSize.width * (25 / Constants.propWidth),
                  height: screenSize.height * (25 / Constants.propHeight),
                  iconHeight: 11,
                  iconWidth: 11,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
