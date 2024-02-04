part of 'radio_player_bloc.dart';

sealed class RadioPlayerEvent {}

final class PlayRadioStation extends RadioPlayerEvent {
  PlayRadioStation({required this.station});

  final Station station;
}

final class PauseRadioStation extends RadioPlayerEvent {
  PauseRadioStation({required this.station});

  final Station station;
}
