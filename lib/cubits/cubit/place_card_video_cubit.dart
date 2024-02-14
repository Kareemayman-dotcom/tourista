import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'place_card_video_state.dart';

enum PlaceCardVideoStatus { loading, playing, paused }

class PlaceCardVideoCubit extends Cubit<PlaceCardVideoState> {
  late final VideoPlayerController controller;

  PlaceCardVideoCubit() : super(PlaceCardVideoInitial()) {
    String Videoaddress = 'assets/pyramids.mp4';
    controller = VideoPlayerController.asset(Videoaddress)
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
    if (state == PlaceCardVideoStatus.playing) {
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
