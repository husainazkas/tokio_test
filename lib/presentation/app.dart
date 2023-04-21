import 'package:flutter/material.dart';

import 'routes/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      title: 'Tokio Marine Test',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
