import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/app/theme/theme_extension.dart';
import 'package:radio/l10n/l10n.dart';
import 'package:radio/radio/radio.dart';
import 'package:radio/radio/widget/paginated_tag_list_widget.dart';

class BrowserPage extends StatefulWidget {
  const BrowserPage({super.key});

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  @override
  void initState() {
    context.read<RadioBloc>().add(InitRadioBrowser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioBloc, RadioState>(
      builder: (context, state) {
        if (state is OnRadioLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  state.loading != true) {
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
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.amber,
                  toolbarHeight: 100,
                  centerTitle: false,
                  pinned: true,
                  snap: true,
                  floating: true,
                  title: Text(
                    context.l10n.chooseATagYouLikeOrRadioStation,
                    style: context.headlineLarge,
                    maxLines: 2,
                  ),
                  bottom: const PreferredSize(
                    preferredSize: Size(double.infinity, 50),
                    child: PaginatedTagListWidget(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      context.l10n.tagOnlineRadio,
                      style: context.headlineLarge,
                    ),
                  ),
                ),
                const PaginatedStationGridListWidget(),
                if (state.loading)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
