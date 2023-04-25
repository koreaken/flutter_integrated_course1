import 'package:flutter/material.dart';
import 'package:integrated_course1/view/screen/future_stream/future_stream_screen.dart';

import 'view/screen/buttons/buttons.dart';
import 'view/screen/chool_check/chool_check_screen.dart';
import 'view/screen/const_constructor/const_constructor_screen.dart';
import 'view/screen/dday/dday_screen.dart';
import 'view/screen/home_screen.dart';
import 'view/screen/image_carousel/image_carousel_screen.dart';
import 'view/screen/navigation/navigation_one_screen.dart';
import 'view/screen/navigation/navigation_screen.dart';
import 'view/screen/navigation/navigation_three_screen.dart';
import 'view/screen/navigation/navigation_two_screen.dart';
import 'view/screen/random_num/random_num_generator_screen.dart';
import 'view/screen/row_column/row_column_screen.dart';
import 'view/screen/splash/splash_screen.dart';
import 'view/screen/statefulwidget/stateful_widget_root.dart';
import 'view/screen/video_player/video_player_screen.dart';
import 'view/screen/webview/webview_screen.dart';

void main() {
  // Flutter 프레임워크가
  // 앱을 실행할 준비가 될때까지 기다린다.
  // runApp 하나만 실행하면 사용안해도 되지만, WebView 최신버전이나 db 등 사용하면 추가
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      // www.google.com -> www.google.com/
      routes: {
        // route 구조 /a/b가 맞지만, 여기서는 심플하게 일괄 /a 적용
        '/': (context) => const SplashScreen(),
        '/${HomeScreen.routeName}': (context) => HomeScreen(),
        '/${RowColumnScreen.routeName}': (context) => const RowColumnScreen(),
        '/${WebViewScreen.routeName}': (context) => WebViewScreen(),
        '/${StatefulWidgetRoot.routeName}': (context) => const StatefulWidgetRoot(),
        '/${ImageCarouselScreen.routeName}': (context) => const ImageCarouselScreen(),
        '/${DdayScreen.routeName}': (context) => const DdayScreen(),
        '/${ConstConstructorScreen.routeName}': (context) => const ConstConstructorScreen(),
        '/${RandomNumGeneratorScreen.routeName}': (context) => const RandomNumGeneratorScreen(),
        '/${ButtonsScreen.routeName}': (context) => const ButtonsScreen(),
        '/${NavigationScreen.routeName}': (context) => const NavigationScreen(),
        '/${NavigationOneScreen.routeName}': (context) => const NavigationOneScreen(),
        '/${NavigationTwoScreen.routeName}': (context) => const NavigationTwoScreen(),
        '/${NavigationThreeScreen.routeName}': (context) => const NavigationThreeScreen(),
        '/${VideoPlayerScreen.routeName}': (context) => const VideoPlayerScreen(),
        '/${ChoolCheckScreen.routeName}': (context) => const ChoolCheckScreen(),
        '/${FutureBuilderScreen.routeName}': (context) => const FutureBuilderScreen(),
      },
    );
  }
}
