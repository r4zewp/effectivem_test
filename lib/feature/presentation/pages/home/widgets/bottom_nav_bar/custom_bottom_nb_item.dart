import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/app_bar/icon_widget.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBarItem extends StatefulWidget {
  const CustomBottomNavBarItem({
    Key? key,
    required this.iconUrl,
    required this.name,
    required this.isActive,
  }) : super(key: key);

  final String iconUrl;
  final String name;
  final bool isActive;

  @override
  State<CustomBottomNavBarItem> createState() => _CustomBottomNavBarItemState();
}

class _CustomBottomNavBarItemState extends State<CustomBottomNavBarItem> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: AnimatedSize(
        duration: Constants.primaryDuration,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBarIconWidget(
              iconUrl: widget.iconUrl,
              color: Colors.white,
            ),
            SizedBox(width: screenSize.width * (7 / Constants.propWidth)),
            widget.isActive
                ? Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: Constants.primaryFontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
