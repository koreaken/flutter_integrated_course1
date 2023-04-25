import 'package:go_router/go_router.dart';

import '../view/screen/buttons/buttons.dart';
import '../view/screen/chool_check/chool_check_screen.dart';
import '../view/screen/const_constructor/const_constructor_screen.dart';
import '../view/screen/dday/dday_screen.dart';
import '../view/screen/future_stream/future_stream_screen.dart';
import '../view/screen/home_screen.dart';
import '../view/screen/image_carousel/image_carousel_screen.dart';
import '../view/screen/navigation/navigation_one_screen.dart';
import '../view/screen/navigation/navigation_screen.dart';
import '../view/screen/navigation/navigation_three_screen.dart';
import '../view/screen/navigation/navigation_two_screen.dart';
import '../view/screen/random_num/random_num_generator_screen.dart';
import '../view/screen/row_column/row_column_screen.dart';
import '../view/screen/splash/splash_screen.dart';
import '../view/screen/statefulwidget/stateful_widget_root.dart';
import '../view/screen/video_player/video_player_screen.dart';
import '../view/screen/webview/webview_screen.dart';

final GoRouter goRouter = GoRouter(
  routes: routes,
  initialLocation: '/splash',
);

List<GoRoute> get routes => [
      GoRoute(
        path: '/${SplashScreen.routeName}',
        name: SplashScreen.routeName,
        builder: (context, state) => const SplashScreen(isGoRouterNavi: true),
      ),
      GoRoute(
        path: '/',
        name: HomeScreen.routeName,
        builder: (context, state) => HomeScreen(isGoRouterNavi: true),
        routes: [
          GoRoute(
            path: RowColumnScreen.routeName,
            name: RowColumnScreen.routeName,
            builder: (context, state) => const RowColumnScreen(),
          ),
          GoRoute(
            path: WebViewScreen.routeName,
            name: WebViewScreen.routeName,
            builder: (context, state) => WebViewScreen(),
          ),
          GoRoute(
            path: StatefulWidgetRoot.routeName,
            name: StatefulWidgetRoot.routeName,
            builder: (context, state) => const StatefulWidgetRoot(),
          ),
          GoRoute(
            path: ImageCarouselScreen.routeName,
            name: ImageCarouselScreen.routeName,
            builder: (context, state) => const ImageCarouselScreen(),
          ),
          GoRoute(
            path: DdayScreen.routeName,
            name: DdayScreen.routeName,
            builder: (context, state) => const DdayScreen(),
          ),
          GoRoute(
            path: ConstConstructorScreen.routeName,
            name: ConstConstructorScreen.routeName,
            builder: (context, state) => const ConstConstructorScreen(),
          ),
          GoRoute(
            path: RandomNumGeneratorScreen.routeName,
            name: RandomNumGeneratorScreen.routeName,
            builder: (context, state) => const RandomNumGeneratorScreen(),
          ),
          GoRoute(
            path: ButtonsScreen.routeName,
            name: ButtonsScreen.routeName,
            builder: (context, state) => const ButtonsScreen(),
          ),
          GoRoute(
            path: NavigationScreen.routeName,
            name: NavigationScreen.routeName,
            builder: (context, state) => const NavigationScreen(),
            routes: [
              GoRoute(
                path: NavigationOneScreen.routeName,
                name: NavigationOneScreen.routeName,
                builder: (context, state) => const NavigationOneScreen(),
                routes: [
                  GoRoute(
                    path: NavigationTwoScreen.routeName,
                    name: NavigationTwoScreen.routeName,
                    builder: (context, state) => const NavigationTwoScreen(),
                    routes: [
                      GoRoute(
                        path: NavigationThreeScreen.routeName,
                        name: NavigationThreeScreen.routeName,
                        builder: (context, state) =>
                            const NavigationThreeScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: VideoPlayerScreen.routeName,
            name: VideoPlayerScreen.routeName,
            builder: (context, state) => const VideoPlayerScreen(),
          ),
          GoRoute(
            path: ChoolCheckScreen.routeName,
            name: ChoolCheckScreen.routeName,
            builder: (context, state) => const ChoolCheckScreen(),
          ),
          GoRoute(
            path: FutureBuilderScreen.routeName,
            name: FutureBuilderScreen.routeName,
            builder: (context, state) => const FutureBuilderScreen(),
          ),
        ],
      ),
    ];
