import 'package:go_router/go_router.dart';

import '../view/screen/buttons/buttons.dart';
import '../view/screen/const_constructor/const_constructor_screen.dart';
import '../view/screen/dday/dday_screen.dart';
import '../view/screen/home_screen.dart';
import '../view/screen/image_carousel/image_carousel_screen.dart';
import '../view/screen/random_num/random_num_generator_screen.dart';
import '../view/screen/row_column/row_column_screen.dart';
import '../view/screen/splash/splash_screen.dart';
import '../view/screen/statefulwidget/stateful_widget_root.dart';
import '../view/screen/webview/webview_screen.dart';

final GoRouter goRouter = GoRouter(
  routes: routes,
  initialLocation: '/splash',
);

List<GoRoute> get routes => [
      GoRoute(
        path: '/${SplashScreen.routeName}',
        name: SplashScreen.routeName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/',
        name: HomeScreen.routeName,
        builder: (context, state) => HomeScreen(),
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
        ]
      ),
    ];
