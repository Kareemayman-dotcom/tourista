part of 'place_video_cubit.dart';

abstract class PlaceVideoState {}

class PlaceVideoInitial extends PlaceVideoState {}

class PlaceVideoLoading extends PlaceVideoState {}

class PlaceVideoPlaying extends PlaceVideoState {}

class PlaceVideoPaused extends PlaceVideoState {}

class PlaceVideoUnpause extends PlaceVideoState {}

class PlaceVideoMuted extends PlaceVideoState {}

class PlaceVideounMuted extends PlaceVideoState {}

class PlaceVideoError extends PlaceVideoState {
  final String message;

  PlaceVideoError(this.message);
}
