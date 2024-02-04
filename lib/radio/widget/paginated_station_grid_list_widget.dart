import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/radio/radio.dart';

class PaginatedStationGridListWidget extends StatelessWidget {
  const PaginatedStationGridListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioBloc, RadioState>(
      builder: (context, state) {
        if (state is OnRadioLoaded) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.stations.length,
              (context, index) => StationCard(
                station: state.stations[index],
              ),
            ),
          );
        }
        if (state is OnRadioLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is OnRadioError) {
          return const Text('error');
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
