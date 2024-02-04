import 'package:datasource/datasource.dart';
import 'package:flutter/material.dart';
import 'package:radio/app/theme/theme_extension.dart';
import 'package:radio/radio/radio.dart';

class DesktopPage extends StatelessWidget {
  const DesktopPage({super.key, this.station});

  final Station? station;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: context.colorScheme.surface,
            ),
            child: const BrowserPage(),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.only(
              top: 16,
              left: 8,
              right: 16,
            ),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber,
            ),
            child: PlayerPage(station: station),
          ),
        ),
      ],
    );
  }
}
