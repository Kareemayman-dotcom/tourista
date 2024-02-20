import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class HomeCubit extends Cubit<VideoPlayerController?> {
  HomeCubit() : super(null);

  Future<void> initializeVideo() async {
    // Create and assign the controller before starting initialization
    final controller = VideoPlayerController.asset('assets/CairoTimeLapse.mp4');

    await controller.initialize().then((_) {
      emit(controller); // Now safe to use the controller variable
      playVideo(); // Automatically play the video after initialization
    }).catchError((error) {
      debugPrint('Error initializing video: $error');
    });

    await controller.setLooping(true); // Ensure looping is set
  }

  void playVideo() {
    state?.play();
  }

  void pauseVideo() {
    state?.pause();
  }

  Future<void> disposeVideo() async {
    await state?.pause();
    await state?.dispose();
  }

  @override
  Future<void> close() async {
    await disposeVideo();
    return super.close();
  }
}
