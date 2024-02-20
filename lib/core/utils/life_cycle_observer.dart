import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/home/cubit/home_cubit.dart';

class LifecycleObserver extends WidgetsBindingObserver {
  BuildContext context;
  LifecycleObserver({
    required this.context,
  });
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<HomeCubit>().playVideo();
    } else if (state == AppLifecycleState.paused) {
      context.read<HomeCubit>().pauseVideo();
    }
    if (state == AppLifecycleState.detached) {
      context.read<HomeCubit>().close();
    }
  }
}
