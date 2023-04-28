import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home_screen.dart';

class SplashScreen extends StatefulWidget {
  static String get routeName => 'splash';

  final bool isGoRouterNavi;

  const SplashScreen({
    this.isGoRouterNavi = false,
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 1),
      () => {
        if (widget.isGoRouterNavi) {
          context.goNamed(HomeScreen.routeName),
        } else {
          Navigator.of(context).popAndPushNamed('/${HomeScreen.routeName}'),
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF99231),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo_flutter.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(height: 32.0),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
