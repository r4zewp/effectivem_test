import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/presentation/bloc/phone_list_bloc/phone_list_bloc.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/best_seller/best_seller_widget.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/bottom_nav_bar/bottom_navbar_widget.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/hot_sales/hot_sales_widget.dart';
import 'package:effectivem_test/feature/presentation/pages/home/widgets/select_category/select_category/select_category_widget.dart';
import 'package:effectivem_test/feature/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/app_bar/app_bar_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final ScrollController _scrlCtrl = ScrollController();

  @override
  void initState() {
    _setDefaultSystemUiPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: buildHomeAppBar(context, title: "Zihuatanejo, Gro"),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _scrlCtrl,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SelectCategoryWidget(),
                SizedBox(
                  height: screenSize.height * (24 / Constants.propHeight),
                ),
                const HotSalesWidget(),
                SizedBox(
                  height: screenSize.height * (24 / Constants.propHeight),
                ),
                BlocProvider(
                  create: (context) => locator<PhoneListBloc>()
                    ..add(PhoneListLoadingInitialized()),
                  child: const BestsellerWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _setDefaultSystemUiPrefs() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom,
        SystemUiOverlay.top,
      ],
    );
  }
}
