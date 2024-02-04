part of 'radio_player_bloc.dart';

sealed class RadioPlayerState {}

final class RadioPlayerInitial extends RadioPlayerState {}

final class OnRadioPlayerPlaying extends RadioPlayerState {
  OnRadioPlayerPlaying({
    required this.playingStaion,
  });

  final Station playingStaion;
}

final class OnRadioPlayerPaused extends RadioPlayerState {
  OnRadioPlayerPaused({
    required this.playingStaion,
  });

  final Station playingStaion;
}
