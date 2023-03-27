import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'buttons/buttons.dart';
import 'const_constructor/const_constructor_screen.dart';
import 'dday/dday_screen.dart';
import 'image_carousel/image_carousel_screen.dart';
import 'random_num/random_num_generator_screen.dart';
import 'row_column/row_column_screen.dart';
import 'splash/splash_screen.dart';
import 'statefulwidget/stateful_widget_root.dart';
import 'webview/webview_screen.dart';

class HomeScreen extends StatelessWidget {
  static String get routeName => 'home';
  final Map<String, String> chapter = {
    // 'Hello World',
    SplashScreen.routeName: 'Splash Screen',
    RowColumnScreen.routeName: 'Row Column Screen',
    WebViewScreen.routeName: 'WebView Screen',
    StatefulWidgetRoot.routeName: 'StatefulWidget Screen',
    ImageCarouselScreen.routeName: 'Image Carousel Screen',
    DdayScreen.routeName: 'D-day Screen',
    ConstConstructorScreen.routeName: 'Const Constructor Screen',
    RandomNumGeneratorScreen.routeName: 'Random Number Generator Screen',
    ButtonsScreen.routeName: 'Buttons Screen',
    // '동영상 플레이어',
    // '오늘도 출근',
    // 'LIVE - 영상통화',
    // '캘린더 스케쥴러',
    // '미세먼지 앱',
  };

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: chapter.entries
                .map(
                  (e) => ElevatedButton(
                    onPressed: () {
                      context.goNamed(e.key);
                    },
                    child: Text(e.value),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
