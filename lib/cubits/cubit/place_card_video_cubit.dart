import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'place_card_video_state.dart';

enum PlaceCardVideoStatus { loading, playing, paused }

class PlaceCardVideoCubit extends Cubit<PlaceCardVideoState> {
  late final VideoPlayerController controller;

  PlaceCardVideoCubit() : super(PlaceCardVideoInitial()) {
    String videoAddress = 'assets/pyramids.mp4';
    controller = VideoPlayerController.asset(videoAddress)
      ..initialize().then((_) {
        controller.setLooping(true);
        emit(PlaceCardVideoInitial());
      });
  }

  void play() {
    controller.play();
    emit(PlaceCardVideoPlaying());
  }

  void pause() {
    if (state is PlaceCardVideoPlaying) {
      controller.pause();
      emit(PlaceCardVideoPaused());
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
