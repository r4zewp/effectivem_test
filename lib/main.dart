import 'package:flutter/material.dart';

import 'feature/presentation/pages/root/root.dart';
import 'feature/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const Root());
}
