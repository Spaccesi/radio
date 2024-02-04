import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:datasource/datasource.dart';
import 'package:radio/app/handlers/audio_player_handler.dart';

part 'radio_player_event.dart';
part 'radio_player_state.dart';

class RadioPlayerBloc extends Bloc<RadioPlayerEvent, RadioPlayerState> {
  RadioPlayerBloc({required this.player}) : super(RadioPlayerInitial()) {
    on<PlayRadioStation>(_playRadioStation);
    on<PauseRadioStation>(_pauseRadioStation);
  }
  final AudioPlayerHandler player;

  FutureOr<void> _playRadioStation(
    PlayRadioStation event,
    Emitter<RadioPlayerState> emit,
  ) async {
    await player.play(event.station.urlResolved);
    emit(OnRadioPlayerPlaying(playingStaion: event.station));
  }

  FutureOr<void> _pauseRadioStation(
    PauseRadioStation event,
    Emitter<RadioPlayerState> emit,
  ) async {
    await player.pause();
    emit(OnRadioPlayerPaused(playingStaion: event.station));
  }
}
