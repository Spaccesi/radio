import 'package:datasource/radio_browser/entities/station_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/radio/bloc/radio_player_bloc.dart';

class RadioPlayerControlsWidget extends StatelessWidget {
  const RadioPlayerControlsWidget({this.station, super.key});

  final Station? station;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioPlayerBloc, RadioPlayerState>(
      builder: (context, state) {
        if (state is OnRadioPlayerPaused) {
          return ListTile(
            title: Text(state.playingStaion.name),
            subtitle: Text(state.playingStaion.country),
            trailing: IconButton(
              onPressed: () {
                context.read<RadioPlayerBloc>().add(
                      PlayRadioStation(
                        station: state.playingStaion,
                      ),
                    );
              },
              icon: const Icon(
                Icons.play_arrow_rounded,
              ),
            ),
          );
        }
        if (state is OnRadioPlayerPlaying) {
          return ListTile(
            title: Text(state.playingStaion.name),
            subtitle: Text(state.playingStaion.country),
            trailing: IconButton(
              onPressed: () {
                context.read<RadioPlayerBloc>().add(
                      PauseRadioStation(
                        station: station ?? state.playingStaion,
                      ),
                    );
              },
              icon: const Icon(
                Icons.pause,
              ),
            ),
          );
        }
        if (station != null &&
            state is! OnRadioPlayerPlaying &&
            state is! OnRadioPlayerPaused) {
          return ListTile(
            title: Text(station!.name),
            subtitle: Text(station!.country),
            leading: Image.network(
              station!.favicon,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.shrink(),
            ),
            trailing: IconButton(
              onPressed: () {
                context.read<RadioPlayerBloc>().add(
                      PlayRadioStation(
                        station: station!,
                      ),
                    );
              },
              icon: const Icon(
                Icons.play_arrow_rounded,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
