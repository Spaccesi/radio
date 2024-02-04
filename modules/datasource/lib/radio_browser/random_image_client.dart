import 'package:dio/dio.dart';

/// Radio browser data source client
class RandomImageDataSource {
  final Dio _dio = Dio();

  final _baseUrl = 'https://source.unsplash.com/random/900×900/?radio,';

  /// This function get stations from Radio browser API
  Future<String> getRandomImage({String? extra}) async {
    final imageData = await _dio.get<dynamic>(
      '$_baseUrl${extra ?? ''}',
    );
    return imageData.headers.map['location']! as String;
  }
}
