// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_entity.freezed.dart';
part 'station_entity.g.dart';

@freezed

/// Radio stations from Radio browser API
class Station with _$Station {
  /// Radio stations from Radio browser API
  const factory Station({
    required String changeuuid,
    required String stationuuid,
    required String name,
    required String url,
    @JsonKey(name: 'url_resolved') required String urlResolved,
    required String homepage,
    required String favicon,
    required String tags,
    required String country,
    required String countrycode,
    @JsonKey(name: 'iso_3166_2') required String? iso31662,
    required String state,
    required String language,
    required String languagecodes,
    required int votes,
    required DateTime lastchangetime,
    @JsonKey(name: 'lastchangetime_iso8601')
    required DateTime lastchangetimeIso8601,
    required String codec,
    required int bitrate,
    required int hls,
    required int lastcheckok,
    required DateTime lastchecktime,
    @JsonKey(name: 'lastchecktime_iso8601')
    required DateTime lastchecktimeIso8601,
    required DateTime lastcheckoktime,
    @JsonKey(name: 'lastcheckoktime_iso8601')
    required DateTime lastcheckoktimeIso8601,
    required DateTime lastlocalchecktime,
    @JsonKey(name: 'lastlocalchecktime_iso8601')
    required DateTime lastlocalchecktimeIso8601,
    required String clicktimestamp,
    @JsonKey(name: 'clicktimestamp_iso8601')
    required dynamic clicktimestampIso8601,
    required int clickcount,
    required int clicktrend,
    @JsonKey(name: 'ssl_error') required int sslError,
    @JsonKey(name: 'geo_lat') required double? geoLat,
    @JsonKey(name: 'geo_long') required double? geoLong,
    @JsonKey(name: 'has_extended_info') required bool hasExtendedInfo,
  }) = _Station;

  /// Transform json into Station object
  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);
}
