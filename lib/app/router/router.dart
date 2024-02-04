import 'package:datasource/datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:radio/app/router/routes.dart';
import 'package:radio/radio/radio.dart';
import 'package:radio/radio/view/desktop_page.dart';
import 'package:radio/radio/widget/radio_player_controls_widget.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.root.path,
      name: Routes.root.name,
      builder: (BuildContext context, GoRouterState state) {
        final radioBrowser = RadioBrowserDataSource();
        return BlocProvider(
          create: (_) => RadioBloc(radioBrowser: radioBrowser),
          child: LayoutBuilder(
            builder: (context, constrains) => Scaffold(
              bottomNavigationBar: const RadioPlayerControlsWidget(),
              body: constrains.maxWidth < 600
                  ? const BrowserPage()
                  : const DesktopPage(),
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.player.path,
      name: Routes.player.name,
      builder: (BuildContext context, GoRouterState state) {
        final radioBrowser = RadioBrowserDataSource();
        // if(state.pathParameters['station_id'] != null && state.extra != null) {

        // }
        return BlocProvider(
          create: (_) => RadioBloc(radioBrowser: radioBrowser),
          child: LayoutBuilder(
            builder: (context, constrains) => Scaffold(
              bottomNavigationBar: const RadioPlayerControlsWidget(),
              body: constrains.maxWidth < 600
                  ? PlayerPage(
                      station: state.extra! as Station,
                    )
                  : DesktopPage(station: state.extra as Station?),
            ),
          ),
        );
      },
    ),
  ],
);
