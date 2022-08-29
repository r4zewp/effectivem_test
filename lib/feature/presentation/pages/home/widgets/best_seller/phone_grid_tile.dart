import 'package:cached_network_image/cached_network_image.dart';
import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/domain/entities/phone_entity.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/best_seller/circle_icon_button_active.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PhoneGridTile extends StatefulWidget {
  const PhoneGridTile({Key? key, required this.phone}) : super(key: key);

  final PhoneEntity phone;

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
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: screenSize.height * (177 / Constants.propHeight),
                  width: screenSize.width * (181 / Constants.propWidth),
                  child: CachedNetworkImage(
                    imageUrl: widget.phone.picture.first,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: screenSize.width * (15 / Constants.propWidth),
                      top: screenSize.height * (11 / Constants.propHeight),
                    ),
                    child: CircleIconButtonActive(
                      iconUrl: 'assets/icons/heart.svg',
                      activeIconUrl: 'assets/icons/heart_filled.svg',
                      backgroundColor: Colors.white,
                      activeIconColor: AppColors.accentColor,
                      width: screenSize.width * (25 / Constants.propWidth),
                      height: screenSize.height * (25 / Constants.propHeight),
                      iconHeight: 11,
                      iconWidth: 11,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor.withOpacity(0.15),
                          offset: const Offset(0, 0),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width * (20 / Constants.propWidth),
                  right: screenSize.width * (20 / Constants.propWidth),
                  bottom: screenSize.height * (14.5 / Constants.propHeight),
                  top: screenSize.height * (7 / Constants.propHeight),
                ),
                child: _buildPhoneDesc(
                  screenSize,
                  phonePrice: widget.phone.priceWithoutDiscount,
                  phoneDiscPrice: widget.phone.discountPrice,
                  phoneName: widget.phone.title,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneDesc(
    Size screenSize, {
    required int phonePrice,
    required int phoneDiscPrice,
    required String phoneName,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _buildPrice(phoneDiscPrice),
              style: const TextStyle(
                color: AppColors.newPriceColor,
                fontFamily: Constants.primaryFontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: screenSize.width * (7 / Constants.propWidth),
            ),
            Text(
              _buildPrice(phonePrice),
              style: const TextStyle(
                color: AppColors.oldPriceColor,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.primaryFontFamily,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenSize.height * (7 / Constants.propHeight),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              phoneName,
              style: const TextStyle(
                color: AppColors.newPriceColor,
                fontFamily: Constants.primaryFontFamily,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _buildPrice(int price) {
    String finalPrice;
    final value = NumberFormat("#,###", "en_US");
    if (price.toString().length > 3) {
      final tempPrice = value.format(price);
      return "\$$tempPrice";
    } else {
      finalPrice = "\$$price";
      return finalPrice;
    }
  }
}
