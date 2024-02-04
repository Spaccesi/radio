part of 'radio_browser_station_bloc.dart';

sealed class RadioEvent {}

class InitRadioBrowser extends RadioEvent {}

class LoadMoreStations extends RadioEvent {
  LoadMoreStations({
    required this.stations,
    required this.tags,
    this.tag,
  });

  final List<Station> stations;
  final List<Tag> tags;
  final Tag? tag;
}

class LoadMoreTags extends RadioEvent {
  LoadMoreTags({
    required this.stations,
    required this.tags,
    this.tag,
  });

  final List<Station> stations;
  final List<Tag> tags;
  final Tag? tag;
}

class FilterStationsByTag extends RadioEvent {
  FilterStationsByTag({
    required this.stations,
    required this.tags,
    this.tag,
  });

  final List<Station> stations;
  final List<Tag> tags;
  final Tag? tag;
}
