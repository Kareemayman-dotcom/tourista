import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'place_video_state.dart';

enum PlaceVideoStatus { loading, playing, paused }

class PlaceVideoCubit extends Cubit<PlaceVideoState> {
  VideoPlayerController? controller; // Make it nullable
  bool muted = false;
  PlaceVideoCubit() : super(PlaceVideoInitial());

  // Method to initialize the controller
  void initializeController(String videoAddress) {
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

  void mute() {
    if (controller?.value.isInitialized == true) {
      controller!.setVolume(0);
      muted = true;
      controller!.play();
      emit(PlaceVideoMuted());
    }
  }

  void unmute() {
    if (controller?.value.isInitialized == true) {
      controller!.setVolume(100);
      muted = false;
      controller!.play();
      emit(PlaceVideounMuted());
    }
  }

  void backInFocus() {
    // if (controller?.value.isInitialized == true) {
    // controller!.play();
    // log('unpause after play');
    emit(PlaceVideoUnpause());
    // }
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
