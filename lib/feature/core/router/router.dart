import 'package:effectivem_test/feature/core/router/ui_pages_path.dart';
import 'package:effectivem_test/feature/presentation/pages/home/screen/home_page_screen.dart';
import 'package:effectivem_test/feature/presentation/pages/page_view/page_view_widget.dart';
import 'package:effectivem_test/feature/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../presentation/pages/wrapper/wrapper.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(
      RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case PagesPath.homepage:
        return platformPageRoute(
          context: context,
          builder: (_) => const HomePageScreen(),
        );

      case PagesPath.rootPageView:
        return platformPageRoute(
          context: context,
          builder: (_) => const PageViewWidget(),
        );

      case PagesPath.splash:
        return platformPageRoute(
          context: context,
          builder: (_) => const Splash(),
        );

      case PagesPath.initial:
        return platformPageRoute(
          context: context,
          builder: (_) => const Splash(),
        );

      case PagesPath.wrapper:
        return platformPageRoute(
          context: context,
          builder: (_) => const Wrapper(),
        );

      default:
        throw UnimplementedError();
    }
  }
}
