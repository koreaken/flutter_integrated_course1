import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

import 'common/go_router.dart';

void main() async {
  // Flutter 프레임워크가
  // 앱을 실행할 준비가 될때까지 기다린다.
  // runApp 하나만 실행하면 사용안해도 되지만, WebView 최신버전이나 db 등 사용하면 추가
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(
    const _GoRouterApp(),
  );
}

class _GoRouterApp extends StatelessWidget {
  const _GoRouterApp({Key? key}) : super(key: key);

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

