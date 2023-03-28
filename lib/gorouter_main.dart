import 'package:flutter/material.dart';

import 'common/go_router.dart';

void main() {
  runApp(
    const _GoRouterApp(),
  );
}

class _GoRouterApp extends StatelessWidget {
  const _GoRouterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'sunflower',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'parisienne',
            fontSize: 80.0,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 50.0,
          ),
          bodyLarge: TextStyle(
            fontSize: 30.0,
          ),
          bodyMedium: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: true,
      routerConfig: goRouter,
    );
  }
}

