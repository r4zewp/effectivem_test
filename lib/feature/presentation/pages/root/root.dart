import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/core/router/custom_page_transition_builder.dart';
import 'package:effectivem_test/feature/core/router/router.dart';
import 'package:effectivem_test/feature/core/router/ui_pages_path.dart';
import 'package:effectivem_test/feature/presentation/bloc/phone_list_bloc/phone_list_bloc.dart';
import 'package:effectivem_test/feature/presentation/bloc/phone_list_hs_bloc/phone_list_hs_bloc.dart';
import 'package:effectivem_test/feature/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhoneListBloc>(
          create: (context) =>
              locator<PhoneListBloc>()..add(PhoneListLoadingInitialized()),
        ),
        BlocProvider<PhoneListHomestoreBloc>(
          create: (context) => locator<PhoneListHomestoreBloc>()
            ..add(PhoneListHomeStoreLoadingInitialized()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PagesPath.splash,
        onGenerateRoute: (settings) =>
            CustomRouter.generateRoute(settings, context),
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            },
          ),
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          backgroundColor: AppColors.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
