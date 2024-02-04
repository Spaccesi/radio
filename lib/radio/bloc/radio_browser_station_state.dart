part of 'radio_browser_station_bloc.dart';

sealed class RadioState {}

final class OnRadioLoading extends RadioState {}

final class OnRadioError extends RadioState {}

final class OnRadioLoaded extends RadioState {
  OnRadioLoaded({
    required this.stations,
    required this.tags,
    this.tag,
    this.allLoaded = false,
    this.loading = false,
  });

  final List<Station> stations;
  final List<Tag> tags;
  final Tag? tag;
  final bool allLoaded;
  final bool loading;
}
