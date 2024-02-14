import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'place_card_video_state.dart';

enum PlaceCardVideoStatus { loading, playing, paused }

class PlaceCardVideoCubit extends Cubit<PlaceCardVideoState> {
  VideoPlayerController? controller; // Make it nullable

  PlaceCardVideoCubit() : super(PlaceCardVideoInitial()) {
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
        emit(PlaceCardVideoError(error));
      });
  }

  void play() {
    if (controller?.value.isInitialized == true) {
      controller!.play();
      log('after play');
      emit(PlaceCardVideoPlaying());
    }
  }

  void pause() {
    if (state is PlaceCardVideoPlaying &&
        controller?.value.isInitialized == true) {
      controller!.pause();
      emit(PlaceCardVideoPaused());
    }
  }

  @override
  Future<void> close() {
    if (controller?.value.isInitialized == true) {
      controller!.dispose();
    }
    return super.close();
  }
}
