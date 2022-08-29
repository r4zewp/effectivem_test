import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/common/constants.dart';
import 'package:effectivem_test/feature/core/router/custom_page_transition_builder.dart';
import 'package:effectivem_test/feature/core/router/router.dart';
import 'package:effectivem_test/feature/core/router/ui_pages_path.dart';
import 'package:effectivem_test/feature/presentation/bloc/app_bloc/app_bloc.dart';
import 'package:effectivem_test/feature/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AppBloc>()..add(AppInitialized()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PagesPath.wrapper,
        onGenerateRoute: (settings) =>
            CustomRouter.generateRoute(settings, context),
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            },
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.scaffoldBackgroundColor,
            elevation: 0.0,
            centerTitle: true,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontFamily: Constants.primaryFontFamily,
              fontWeight: FontWeight.w700,
            ),
            headline2: TextStyle(
              color: Colors.black,
              fontFamily: Constants.primaryFontFamily,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            headline3: TextStyle(
              color: AppColors.accentColor,
              fontFamily: Constants.primaryFontFamily,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            headline4: TextStyle(
              fontFamily: Constants.primaryFontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            headline5: TextStyle(
              fontFamily: Constants.primaryFontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.accentColor,
            ),
            headline6: TextStyle(
              fontFamily: Constants.primaryFontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.hintColor,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          backgroundColor: AppColors.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
