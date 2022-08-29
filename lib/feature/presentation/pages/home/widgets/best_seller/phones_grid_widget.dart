import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/best_seller/phone_grid_tile.dart';
import 'package:flutter/material.dart';

class PhonesGridWidget extends StatefulWidget {
  const PhonesGridWidget({Key? key}) : super(key: key);

  @override
  State<PhonesGridWidget> createState() => _PhonesGridWidgetState();
}

class _PhonesGridWidgetState extends State<PhonesGridWidget> {
  final SliverGridDelegateWithFixedCrossAxisCount _gridDlgt =
      const SliverGridDelegateWithFixedCrossAxisCount(
    mainAxisExtent: 227,
    crossAxisCount: 2,
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * (384 / Constants.propWidth),
      child: GridView.builder(
        gridDelegate: _gridDlgt,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const PhoneGridTile();
        },
      ),
    );
  }
}
