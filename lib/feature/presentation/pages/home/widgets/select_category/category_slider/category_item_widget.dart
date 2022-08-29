import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.isActive,
    required this.updateIndex,
  }) : super(key: key);

  final String name;
  final String icon;
  final bool isActive;
  final void Function(int index) updateIndex;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  int get currentElementIndex =>
      Constants.categories.keys.toList().indexOf(widget.name);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        right: screenSize.width * (23 / Constants.propWidth),
        bottom: screenSize.height * (7 / Constants.propHeight),
      ),
      child: GestureDetector(
        onTap: () {
          widget.updateIndex(currentElementIndex);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: screenSize.width * (71 / Constants.propWidth),
              height: screenSize.height * (81 / Constants.propHeight),
              child: AnimatedContainer(
                duration: Constants.primaryDuration,
                width: screenSize.width * (71 / Constants.propWidth),
                height: screenSize.height * (71 / Constants.propHeight),
                decoration: BoxDecoration(
                  color: widget.isActive ? AppColors.accentColor : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: SizedBox(
                  width: screenSize.width * (31 / Constants.propWidth),
                  height: screenSize.height * (32 / Constants.propHeight),
                  child: SvgPicture.asset(
                    widget.icon,
                    color: widget.isActive
                        ? Colors.white
                        : AppColors.unselectedIconColor,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            AnimatedDefaultTextStyle(
              duration: Constants.primaryDuration,
              style: widget.isActive
                  ? Theme.of(context).textTheme.headline5!
                  : Theme.of(context).textTheme.headline4!,
              child: Text(
                widget.name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
