import 'package:datasource/datasource.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:radio/app/app.dart';

class StationCard extends StatelessWidget {
  const StationCard({
    required this.station,
    super.key,
    this.isPlaying,
  });
  final Station station;
  final bool? isPlaying;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.goNamed(
        Routes.player.name,
        extra: station,
        pathParameters: {'station_id': station.changeuuid},
      ),
      leading: Stack(
        children: [
          if (isPlaying == true)
            IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow))
          else
            const SizedBox.shrink(),
          Image.network(
            station.favicon,
            width: 42,
            height: 42,
            errorBuilder: (context, error, stackTrace) => const SizedBox(
              width: 42,
              height: 42,
            ),
          ),
        ],
      ),
      selected: true,
      title: Text(
        station.name,
        style: context.titleMedium,
      ),
      subtitle: Text(
        station.country,
        maxLines: 1,
      ),
    );
  }
}
