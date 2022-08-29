import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/app_bar/icon_widget.dart';
import 'package:effectivem_test/feature/presentation/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _searchFieldCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenSize.width * (300 / Constants.propWidth),
          child: TextField(
            controller: _searchFieldCtrl,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: Colors.black,
            style: Theme.of(context).textTheme.headline6,
            cursorHeight: 12,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                bottom: screenSize.height * (10 / Constants.propHeight),
                top: screenSize.height * (10 / Constants.propHeight),
              ),
              hintText: Constants.searchHintText,
              hintStyle: Theme.of(context).textTheme.headline6,
              filled: true,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              prefixIcon: AppBarIconWidget(
                iconUrl: 'assets/icons/search.svg',
                color: AppColors.accentColor,
                padding: EdgeInsets.only(
                  left: screenSize.width * (24 / Constants.propWidth),
                  right: screenSize.width * (20 / Constants.propWidth),
                ),
              ),
              prefixIconColor: AppColors.accentColor,
              isDense: true,
              isCollapsed: true,
              prefixIconConstraints:
                  const BoxConstraints(maxHeight: 20, minHeight: 20),
              errorBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
              enabledBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              focusedBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              focusedErrorBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              disabledBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
            ),
          ),
        ),
        SizedBox(
          width: screenSize.width * (11 / Constants.propWidth),
        ),
        CircleIconButton(
          iconUrl: 'assets/icons/qr.svg',
          backgroundColor: AppColors.accentColor,
          activeIconColor: Colors.white,
          width: screenSize.width * (34 / Constants.propWidth),
          height: screenSize.height * (34 / Constants.propHeight),
          iconHeight: 15,
          iconWidth: 15,
        ),
      ],
    );
  }
}
