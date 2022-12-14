import 'package:effectivem_test/feature/common/colors.dart';
import 'package:effectivem_test/feature/presentation/pages/splash/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      body: Center(
        child: Logo(),
      ),
    );
  }
}
