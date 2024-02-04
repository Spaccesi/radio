import 'package:datasource/radio_browser/entities/entities.dart';
import 'package:datasource/radio_browser/random_image_client.dart';
import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';

/// Radio browser data source client
class RadioBrowserDataSource {
  final Dio _dio = Dio();
  final randomImage = RandomImageDataSource();

  final _baseUrl = 'https://de1.api.radio-browser.info/json';

  /// This function get stations from Radio browser API
  /// - [limit] number of returned datarows (stations) starting with offset
  /// - [offset] starting value of the result list from the database
  Future<List<Station>> getStations({int offset = 0, int limit = 10}) async {
    final stations = <Station>[];
    try {
      final stationsData = await _dio.get<List<dynamic>>(
        '$_baseUrl/stations',
        queryParameters: {
          'limit': limit,
          'offset': offset,
          'hidebroken': true,
        },
      );
      for (final stat in stationsData.data!) {
        try {
          final station = Station.fromJson(stat as Map<String, dynamic>);
          stations.add(station);
        } catch (e) {
          Fimber.e('Error parsing station', ex: e);
        }
      }
      // stations = stationsData.data!
      //     .map((e) {
      //       try {

      //         final station = Station.fromJson(e as Map<String, dynamic>);
      //         final image = await randomImage.getRandomImage(extra: station.tags);
      //         return station.copyWith(state: image);
      //       } catch (e) {
      //         Fimber.e('Error parsing station', ex: e);
      //         return null;
      //       }
      //     })
      //     .nonNulls
      //     .toList();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      Fimber.e('Get stations fail', ex: e);
    }
    return stations;
  }

  /// This function get all tags from Radio browser API
  /// - [limit] number of returned datarows (stations) starting with offset
  /// - [offset] starting value of the result list from the database
  Future<List<Tag>> getTags({int offset = 0, int limit = 10}) async {
    var tags = <Tag>[];
    try {
      final tagData = await _dio.get<List<dynamic>>(
        '$_baseUrl/tags',
        queryParameters: {
          'limit': limit,
          'offset': offset,
          'hidebroken': true,
          'order': 'stationcount',
        },
      );
      tags = tagData.data!
          .map((e) {
            try {
              return Tag.fromJson(e as Map<String, dynamic>);
            } catch (e) {
              Fimber.e('Error parsing tag', ex: e);
              return null;
            }
          })
          .nonNulls
          .toList();
    } catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      Fimber.e('Get tags fail', ex: e);
    }
    return tags;
  }

  /// This function get stations from Radio browser API
  /// - [tag] tag where stations belong
  /// - [limit] number of returned datarows (stations) starting with offset
  /// - [offset] starting value of the result list from the database
  Future<List<Station>> getStationsByTag({
    required Tag tag,
    int offset = 0,
    int limit = 10,
  }) async {
    var stations = <Station>[];
    try {
      final stationsData = await _dio.get<List<dynamic>>(
        '$_baseUrl/stations/bytagexact/${tag.name}',
        queryParameters: {
          'limit': limit,
          'offset': offset,
          'hidebroken': true,
        },
      );
      stations = stationsData.data!
          .map((e) {
            try {
              return Station.fromJson(e as Map<String, dynamic>);
            } catch (e) {
              Fimber.e('Error parsing station', ex: e);
              return null;
            }
          })
          .nonNulls
          .toList();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      Fimber.e('Get stations by tag fail', ex: e);
    }
    return stations;
  }

  /// This function get top stations from Radio browser API
  /// - [limit] number of returned datarows (stations) starting with offset
  /// - [offset] starting value of the result list from the database
  Future<List<Station>> getTopStations({
    int offset = 0,
    int limit = 10,
  }) async {
    var stations = <Station>[];
    try {
      final stationsData = await _dio.get<List<dynamic>>(
        '$_baseUrl/stations/topclick',
        queryParameters: {
          'limit': limit,
          'offset': offset,
          'hidebroken': true,
        },
      );
      stations = stationsData.data!
          .map((e) {
            try {
              return Station.fromJson(e as Map<String, dynamic>);
            } catch (e) {
              Fimber.e('Error parsing station', ex: e);
              return null;
            }
          })
          .nonNulls
          .toList();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      Fimber.e('Get stations by tag fail', ex: e);
    }
    return stations;
  }
}
