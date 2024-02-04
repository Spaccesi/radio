import 'package:flutter/material.dart';
import 'package:radio/radio/widget/radio_player_controls_widget.dart';

class Layout extends StatelessWidget {
  const Layout({
    required this.body,
    super.key,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) => Scaffold(
        body: body,
        bottomNavigationBar: const RadioPlayerControlsWidget(),
      ),
    );
  }
}
