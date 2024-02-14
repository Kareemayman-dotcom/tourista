part of 'place_card_video_cubit.dart';

abstract class PlaceCardVideoState {}

class PlaceCardVideoInitial extends PlaceCardVideoState {}

class PlaceCardVideoLoading extends PlaceCardVideoState {}

class PlaceCardVideoPlaying extends PlaceCardVideoState {}

class PlaceCardVideoPaused extends PlaceCardVideoState {}

class PlaceCardVideoError extends PlaceCardVideoState {
  final String message;

  PlaceCardVideoError(this.message);
}
