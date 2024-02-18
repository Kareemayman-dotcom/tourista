import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/home/cubit/home_cubit.dart';

class AppLifecycleManager extends WidgetsBindingObserver {
  final BuildContext context;

  AppLifecycleManager(this.context) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    final homeCubit = context.read<HomeCubit>();
    if (state == AppLifecycleState.resumed) {
      log('App is resumed');
      // App is resumed
      // You can reinitialize video or check its state here
      homeCubit.initializeVideo(); // Example action
    } else if (state == AppLifecycleState.paused) {
      log('App is paused');
      // App is paused
      // Perform any cleanup or pausing actions here
      await homeCubit.disposeVideo();
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
