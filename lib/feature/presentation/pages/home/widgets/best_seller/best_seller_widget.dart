import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/bloc/phone_list_bloc/phone_list_bloc.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/best_seller/phones_grid_widget.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/select_category/select_category/title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestsellerWidget extends StatelessWidget {
  const BestsellerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocConsumer<PhoneListBloc, PhoneListState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: screenSize.width * (384 / Constants.propWidth),
              child: const TitleWidget(
                titleButtonText: Constants.seeMore,
                titleText: Constants.bestSeller,
              ),
            ),
            SizedBox(
              height: screenSize.height * (8 / Constants.propHeight),
            ),
            if (state is PhoneListLoading)
              const Center(
                child: CupertinoActivityIndicator(
                  color: AppColors.accentColor,
                ),
              ),
            if (state is PhoneListLoaded)
              SizedBox(
                width: screenSize.width * (384 / Constants.propWidth),
                child: PhonesGridWidget(
                  phones: state.phones,
                ),
              ),
          ],
        );
      },
    );
  }
}
