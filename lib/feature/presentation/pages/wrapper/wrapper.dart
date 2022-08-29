import 'package:effectivem_test/feature/core/router/ui_pages_path.dart';
import 'package:effectivem_test/feature/presentation/bloc/app_bloc/app_bloc.dart';
import 'package:effectivem_test/feature/presentation/bloc/phone_list_bloc/phone_list_bloc.dart';
import 'package:effectivem_test/feature/presentation/bloc/phone_list_hs_bloc/phone_list_hs_bloc.dart';
import 'package:effectivem_test/feature/presentation/pages/wrapper/widgets/custom_loading_widget.dart';
import 'package:effectivem_test/feature/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  locator<PhoneListBloc>()..add(PhoneListLoadingInitialized()),
            ),
            BlocProvider(
              create: (context) => locator<PhoneListHomestoreBloc>()
                ..add(PhoneListHomeStoreLoadingInitialized()),
            ),
          ],
          child: const CustomLoadingWidget(),
        );
      },
      listener: (context, state) {
        if (state is AppLoadingState) {
          Navigator.of(context).pushNamed(PagesPath.splash);
        }
        if (state is AppLoadedState) {
          Navigator.of(context).pushNamed(PagesPath.homepage);
        }
      },
    );
  }
}
