import 'package:datasource/radio_browser/entities/tag_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/radio/radio.dart';

class PaginatedTagListWidget extends StatelessWidget {
  const PaginatedTagListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioBloc, RadioState>(
      builder: (context, state) {
        if (state is OnRadioLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification &&
                  !state.loading &&
                  notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent &&
                  notification.metrics.extentAfter == 0) {
                context.read<RadioBloc>().add(
                      LoadMoreStations(
                        stations: state.stations,
                        tags: state.tags,
                        tag: state.tag,
                      ),
                    );
              }
              return false;
            },
            child: Container(
              color: Colors.amber,
              height: 45,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TagWidget(
                    tag: state.tags[index],
                    selected: state.tag == state.tags[index],
                  );
                },
                itemCount: state.tags.length,
              ),
            ),
          );
        }
        return const Text('no');
      },
    );
  }
}

class TagWidget extends StatelessWidget {
  const TagWidget({required this.tag, required this.selected, super.key});

  final Tag tag;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: selected
          ? const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              gradient: LinearGradient(
                colors: [
                  Colors.amber,
                  Colors.orange,
                ],
              ),
            )
          : null,
      child: ElevatedButton(
        style: const ButtonStyle(
          shadowColor: MaterialStatePropertyAll(Colors.transparent),
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        ),
        child: Text(tag.name),
        onPressed: () => context
            .read<RadioBloc>()
            .add(FilterStationsByTag(stations: [], tags: [], tag: tag)),
      ),
    );
  }
}
