import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:datasource/datasource.dart';

part 'radio_browser_station_state.dart';
part 'radio_browser_stations_event.dart';

class RadioBloc extends Bloc<RadioEvent, RadioState> {
  RadioBloc({required this.radioBrowser}) : super(OnRadioLoading()) {
    on<InitRadioBrowser>(_initStations);
    on<LoadMoreStations>(_loadMoreStations);
    on<LoadMoreTags>(_loadMoreTags);
    on<FilterStationsByTag>(_filterStationsByTag);
  }

  final RadioBrowserDataSource radioBrowser;
  final limit = 15;

  FutureOr<void> _initStations(
    InitRadioBrowser event,
    Emitter<RadioState> emit,
  ) async {
    emit(OnRadioLoading());
    var allLoaded = false;
    final stations = await radioBrowser.getTopStations(
      limit: limit,
    );
    final tags = await radioBrowser.getTags(
      limit: limit,
    );
    if (stations.length < limit) {
      allLoaded = true;
    }
    emit(
      OnRadioLoaded(
        stations: stations,
        tags: tags,
        allLoaded: allLoaded,
      ),
    );
  }

  FutureOr<void> _loadMoreStations(
    LoadMoreStations event,
    Emitter<RadioState> emit,
  ) async {
    emit(
      OnRadioLoaded(
        stations: event.stations,
        tags: event.tags,
        tag: event.tag,
        loading: true,
      ),
    );
    print('getting more');
    var allLoaded = false;
    final newStations = event.stations
      ..addAll(
        event.tag != null
            ? await radioBrowser.getStationsByTag(
                tag: event.tag!,
                offset: event.stations.length,
                limit: limit,
              )
            : await radioBrowser.getTopStations(
                offset: event.stations.length,
                limit: limit,
              ),
      );

    if (newStations.length < limit) {
      allLoaded = true;
    }
    emit(
      OnRadioLoaded(
        stations: newStations,
        allLoaded: allLoaded,
        tags: event.tags,
        tag: event.tag,
      ),
    );
  }

  FutureOr<void> _loadMoreTags(
    LoadMoreTags event,
    Emitter<RadioState> emit,
  ) async {
    emit(
      OnRadioLoaded(
        stations: event.stations,
        tags: event.tags,
        tag: event.tag,
        loading: true,
      ),
    );
    var allLoaded = false;
    final newStations = event.stations
      ..addAll(
        event.tag != null
            ? await radioBrowser.getStationsByTag(
                offset: event.stations.length,
                limit: limit,
                tag: event.tag!,
              )
            : await radioBrowser.getStations(
                offset: event.stations.length,
                limit: limit,
              ),
      );

    if (newStations.length > limit) {
      allLoaded = true;
    }
    emit(
      OnRadioLoaded(
        stations: newStations,
        allLoaded: allLoaded,
        tags: event.tags,
        tag: event.tag,
      ),
    );
  }

  FutureOr<void> _filterStationsByTag(
    FilterStationsByTag event,
    Emitter<RadioState> emit,
  ) async {
    OnRadioLoaded(
      stations: [],
      tags: event.tags,
      tag: event.tag,
      loading: true,
    );
    final stations = await radioBrowser.getStationsByTag(tag: event.tag!);
    emit(
      OnRadioLoaded(
        stations: stations,
        tags: event.tags,
        tag: event.tag,
      ),
    );
  }
}
