import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:integrated_course1/view/screen/home_screen.dart';
import 'package:integrated_course1/view/screen/navigation/navigation_one_screen.dart';

import '../../layout/navigation_main_layout.dart';

class NavigationScreen extends StatelessWidget {
  static String get routeName => 'navigation';

  final bool isGoRouterNavi;

  const NavigationScreen({
    this.isGoRouterNavi = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: NavigationMainLayout(
        title: 'Navigation Screen',
        children: [
          ElevatedButton(
            onPressed: () {
              final result = Navigator.of(context).canPop();
              print(result);
            },
            child: const Text('Can Pop'),
          ),
          ElevatedButton(
            onPressed: () {
              // if (isGoRouterNavi) {
              //   context.goNamed(HomeScreen.routeName);
              //   return;
              // }
              Navigator.of(context).maybePop();
            },
            child: const Text('Maybe Pop'),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const NavigationOneScreen(
                    number: 123,
                  ),
                ),
              );

              print(result);
            },
            child: const Text('Push'),
          ),
        ],
      ),
    );
  }
}
