import 'package:datasource/datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/radio/bloc/radio_player_bloc.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({required this.station, super.key});

  final Station? station;

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  void initState() {
    if (widget.station != null) {
      context
          .read<RadioPlayerBloc>()
          .add(PlayRadioStation(station: widget.station!));
    }
    super.initState();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            stretch: true,
            floating: true,
            backgroundColor: Colors.amber,
            title: const Text(
              'asd',
              maxLines: 2,
            ),
            toolbarHeight: 300,
            expandedHeight: 300,
            flexibleSpace: Container(
              decoration: const BoxDecoration(color: Colors.red),
              height: 300,
              child: const Column(
                children: [
                  Text('asdasd'),
                  Text('asdasd'),
                  Text('asdasd'),
                  Text('asdasd'),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) => Text(index.toString()),
            itemCount: 50,
          ),
        ],
      ),
    );
  }
}
