import 'package:flutter/material.dart';

import 'generated/l10n.dart';
import 'injection_container.dart' as ic;
import 'routing/index.dart';

class SpaceXBookApplication extends StatefulWidget {
  const SpaceXBookApplication({super.key});

  @override
  State<SpaceXBookApplication> createState() => _SpaceXBookApplicationState();
}

class _SpaceXBookApplicationState extends State<SpaceXBookApplication> {
  @override
  void initState() {
    super.initState();
    S.load(Locale('en'));
  }

  @override
  Widget build(BuildContext context) {
    AppRouter router = ic.sl<AppRouter>();

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [S.delegate],
      routerDelegate: router.delegate(),
    );
  }
}
