// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationImpl _$$StationImplFromJson(Map<String, dynamic> json) =>
    _$StationImpl(
      changeuuid: json['changeuuid'] as String,
      stationuuid: json['stationuuid'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      urlResolved: json['url_resolved'] as String,
      homepage: json['homepage'] as String,
      favicon: json['favicon'] as String,
      tags: json['tags'] as String,
      country: json['country'] as String,
      countrycode: json['countrycode'] as String,
      iso31662: json['iso_3166_2'] as String?,
      state: json['state'] as String,
      language: json['language'] as String,
      languagecodes: json['languagecodes'] as String,
      votes: json['votes'] as int,
      lastchangetime: DateTime.parse(json['lastchangetime'] as String),
      lastchangetimeIso8601:
          DateTime.parse(json['lastchangetime_iso8601'] as String),
      codec: json['codec'] as String,
      bitrate: json['bitrate'] as int,
      hls: json['hls'] as int,
      lastcheckok: json['lastcheckok'] as int,
      lastchecktime: DateTime.parse(json['lastchecktime'] as String),
      lastchecktimeIso8601:
          DateTime.parse(json['lastchecktime_iso8601'] as String),
      lastcheckoktime: DateTime.parse(json['lastcheckoktime'] as String),
      lastcheckoktimeIso8601:
          DateTime.parse(json['lastcheckoktime_iso8601'] as String),
      lastlocalchecktime: DateTime.parse(json['lastlocalchecktime'] as String),
      lastlocalchecktimeIso8601:
          DateTime.parse(json['lastlocalchecktime_iso8601'] as String),
      clicktimestamp: json['clicktimestamp'] as String,
      clicktimestampIso8601: json['clicktimestamp_iso8601'],
      clickcount: json['clickcount'] as int,
      clicktrend: json['clicktrend'] as int,
      sslError: json['ssl_error'] as int,
      geoLat: (json['geo_lat'] as num?)?.toDouble(),
      geoLong: (json['geo_long'] as num?)?.toDouble(),
      hasExtendedInfo: json['has_extended_info'] as bool,
    );

Map<String, dynamic> _$$StationImplToJson(_$StationImpl instance) =>
    <String, dynamic>{
      'changeuuid': instance.changeuuid,
      'stationuuid': instance.stationuuid,
      'name': instance.name,
      'url': instance.url,
      'url_resolved': instance.urlResolved,
      'homepage': instance.homepage,
      'favicon': instance.favicon,
      'tags': instance.tags,
      'country': instance.country,
      'countrycode': instance.countrycode,
      'iso_3166_2': instance.iso31662,
      'state': instance.state,
      'language': instance.language,
      'languagecodes': instance.languagecodes,
      'votes': instance.votes,
      'lastchangetime': instance.lastchangetime.toIso8601String(),
      'lastchangetime_iso8601':
          instance.lastchangetimeIso8601.toIso8601String(),
      'codec': instance.codec,
      'bitrate': instance.bitrate,
      'hls': instance.hls,
      'lastcheckok': instance.lastcheckok,
      'lastchecktime': instance.lastchecktime.toIso8601String(),
      'lastchecktime_iso8601': instance.lastchecktimeIso8601.toIso8601String(),
      'lastcheckoktime': instance.lastcheckoktime.toIso8601String(),
      'lastcheckoktime_iso8601':
          instance.lastcheckoktimeIso8601.toIso8601String(),
      'lastlocalchecktime': instance.lastlocalchecktime.toIso8601String(),
      'lastlocalchecktime_iso8601':
          instance.lastlocalchecktimeIso8601.toIso8601String(),
      'clicktimestamp': instance.clicktimestamp,
      'clicktimestamp_iso8601': instance.clicktimestampIso8601,
      'clickcount': instance.clickcount,
      'clicktrend': instance.clicktrend,
      'ssl_error': instance.sslError,
      'geo_lat': instance.geoLat,
      'geo_long': instance.geoLong,
      'has_extended_info': instance.hasExtendedInfo,
    };
