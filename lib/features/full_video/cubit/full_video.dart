import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullVideoCubit extends Cubit<YoutubePlayerController?> {
  FullVideoCubit() : super(null);

  void initYoutubePlayer(String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    final controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        captionLanguage: "ar",
        showLiveFullscreenButton: true,
        useHybridComposition: false,
      ),
    );
    emit(controller);
  }

  @override
  Future<void> close() {
    state?.dispose();
    return super.close();
  }
}
