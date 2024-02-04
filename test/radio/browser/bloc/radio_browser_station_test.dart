import 'package:bloc_test/bloc_test.dart';
import 'package:datasource/datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:radio/radio/radio.dart';

void main() {
  final radioBrowser = RadioBrowserDataSource();

  group('Radio browser station bloc test', () {
    // test('initial state is 0 length', () {
    //   expect(StationBloc(radioBrowser: radioBrowser).state, equals(0));
    // });

    blocTest<RadioBloc, RadioState>(
      'Load more stations',
      build: () => RadioBloc(radioBrowser: radioBrowser),
      act: (bloc) => bloc.add(
        LoadMoreStations(
          stations: [],
          tags: [],
        ),
      ),
      expect: () => <RadioState>[
        OnRadioLoaded(
          stations: [],
          tags: [],
        ),
        OnRadioLoading(),
      ],
    );
  });
}
