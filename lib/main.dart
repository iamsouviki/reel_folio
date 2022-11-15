import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reel_folio/route/reel_folio_route.dart';

import 'util/size_config.dart';

void main() {
  runApp(const ProviderScope(child: ReelFolioApp()));
}

class ReelFolioApp extends StatelessWidget {
  const ReelFolioApp({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            SizeConfig().init(constraints, orientation);
            return const MaterialApp(
              title: 'Reel Folio',
              debugShowCheckedModeBanner: false,
              onGenerateRoute: ReelFolioRoute.generateRoute,
            );
          },
        );
      },
    );
  }
}
