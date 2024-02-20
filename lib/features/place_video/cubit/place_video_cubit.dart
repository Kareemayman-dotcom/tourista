import 'dart:developer';
import 'package:flutter/widgets.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'place_video_state.dart';

enum PlaceVideoStatus { loading, playing, paused }

class PlaceVideoCubit extends Cubit<PlaceVideoState> with WidgetsBindingObserver {
  PlaceVideoCubit() : super(PlaceVideoInitial()) {
    WidgetsBinding.instance.addObserver(this); // Register the cubit as an observer
  }

  VideoPlayerController? controller; 
  bool muted = false;

  // Initialize video controller
  void initializeController(String videoAddress) {
    controller?.dispose(); // Dispose existing controller if any
    controller = VideoPlayerController.asset(videoAddress)
      ..initialize().then((_) {
        controller!.setLooping(true);
        play(); // Start playing after initialization
      }).catchError((error) {
        log('Error initializing video player: $error');
        emit(PlaceVideoError(error)); 
      });
  }

  // Lifecycle management
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state); 
    switch (state) {
      case AppLifecycleState.paused:
        pause();
        break;
      case AppLifecycleState.resumed:
        play();
        break;
      default:
        break;
    }
  }

  // Play video
  void play() {
    if (controller?.value.isInitialized == true) {
      controller!.play();
      emit(PlaceVideoPlaying());
    }
  }

  // Mute video
  void mute() {
    if (controller?.value.isInitialized == true) {
      controller!.setVolume(0);
      muted = true;
      emit(PlaceVideoMuted());
    }
  }

  // Unmute video
  void unmute() {
    if (controller?.value.isInitialized == true) {
      controller!.setVolume(100);
      muted = false;
      emit(PlaceVideounMuted());
    }
  }

  // Pause video
  void pause() {
    if (state is PlaceVideoPlaying && controller?.value.isInitialized == true) {
      controller!.pause();
      emit(PlaceVideoPaused());
    }
  }

  // Dispose of the controller
  void disposeController() {
    controller?.dispose();
    controller = null; 
  }

  // Clean up when closing the cubit
  @override
  Future<void> close() {
    disposeController(); 
    WidgetsBinding.instance.removeObserver(this); // Remove as observer
    return super.close();
  }
}
