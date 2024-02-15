import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'place_video_state.dart';

enum PlaceVideoStatus { loading, playing, paused }

class PlaceVideoCubit extends Cubit<PlaceVideoState> {
  VideoPlayerController? controller; // Make it nullable

  PlaceVideoCubit() : super(PlaceVideoInitial()) {
    initializeController();
  }

  // Method to initialize the controller
  void initializeController() {
    String videoAddress = 'assets/pyramids.mp4';
    // Dispose the old controller if it exists
    controller?.dispose();
    // Create a new controller
    controller = VideoPlayerController.asset(videoAddress)
      ..initialize().then((_) {
        controller!.setLooping(true);
        play();
      }).catchError((error) {
        // Handle error on initialization
        log('Error initializing video player: $error');
        emit(PlaceVideoError(error));
      });
  }

  void play() {
    if (controller?.value.isInitialized == true) {
      controller!.play();
      log('after play');
      emit(PlaceVideoPlaying());
    }
  }

  void pause() {
    if (state is PlaceVideoPlaying && controller?.value.isInitialized == true) {
      controller!.pause();
      emit(PlaceVideoPaused());
    }
  }

  void disposeController() {
    controller?.dispose();
    controller = null; // Ensure the reference is cleared
  }

  @override
  Future<void> close() {
    if (controller?.value.isInitialized == true) {
      disposeController();
    }
    return super.close();
  }
}
