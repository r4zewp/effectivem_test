import 'package:effectivem_test/feature/presentation/pages/root/widgets/root_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../service_locator.dart' as di;

void run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  _setSystemUiPrefsForSplash();

  runApp(const Root());
}

void _setSystemUiPrefsForSplash() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.bottom,
    ],
  );
}
