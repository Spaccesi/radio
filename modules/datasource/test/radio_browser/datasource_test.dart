import 'dart:math';

import 'package:datasource/radio_browser/radio_browser_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RadioBrowserDataSource radioBrowser;
  late int offset;

  setUp(() {
    radioBrowser = RadioBrowserDataSource();
    offset = Random().nextInt(1000);
  });
  group('Radio browser datasource', () {
    test('Get stations', () async {
      expect((await radioBrowser.getStations(offset: offset)).length, 10);
    });

    test('Get tags', () async {
      expect((await radioBrowser.getTags(offset: offset)).length, 10);
    });

    test('Get stations by tag', () async {
      final tag = (await radioBrowser.getTags(offset: offset, limit: 1)).first;
      expect(
        (await radioBrowser.getStationsByTag(tag: tag)).length,
        tag.stationcount,
      );
    });
  });
}
