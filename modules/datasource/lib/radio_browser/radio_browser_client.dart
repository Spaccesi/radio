import 'package:datasource/radio_browser/entities/entities.dart';
import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';

/// Radio browser data source client
class RadioBrowserDataSource {
  final Dio _dio = Dio();

  final _baseUrl = 'https://de1.api.radio-browser.info/json';

  /// This function get stations from Radio browser API
  /// - [limit] number of returned datarows (stations) starting with offset
  /// - [offset] starting value of the result list from the database
  Future<List<Station>> getStations({int offset = 0, int limit = 10}) async {
    var stations = <Station>[];
    try {
      final stationsData = await _dio.get<dynamic>(
        '$_baseUrl/stations',
        queryParameters: {
          'limit': limit,
          'offset': offset,
          'hidebroken': true,
        },
      );
      stations = (stationsData.data as List)
          .map((e) => Station.fromJson(e as Map<String, dynamic>))
          .toList();
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
      final tagData = await _dio.get<dynamic>(
        '$_baseUrl/tags',
        queryParameters: {
          'limit': limit,
          'offset': offset,
          'hidebroken': true,
          'order': 'stationcount',
        },
      );
      tags = (tagData.data as List)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
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
      final stationsData = await _dio.get<dynamic>(
        '$_baseUrl/stations/bytagexact/${tag.name}',
        queryParameters: {
          'limit': limit,
          'offset': offset,
          'hidebroken': true,
        },
      );
      stations = (stationsData.data as List)
          .map((e) => Station.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      Fimber.e('Get stations by tag fail', ex: e);
    }
    return stations;
  }
}
