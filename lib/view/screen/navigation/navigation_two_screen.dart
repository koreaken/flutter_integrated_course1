import 'package:flutter/material.dart';
import 'package:integrated_course1/view/layout/navigation_main_layout.dart';
import 'package:integrated_course1/view/screen/home_screen.dart';
import 'package:integrated_course1/view/screen/navigation/navigation_screen.dart';
import 'package:integrated_course1/view/screen/navigation/navigation_three_screen.dart';

class NavigationTwoScreen extends StatelessWidget {
  static String get routeName => 'navigation_two';

  const NavigationTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return NavigationMainLayout(
      title: 'Navigation Two',
      children: [
        Text(
          'arguments: $arguments',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            try {
              // GoRouter 으로 실행 시, pushNamed Error 발생
              Navigator.of(context).pushNamed(
                '/${NavigationThreeScreen.routeName}',
                arguments: 90,
              );
            } catch(e, stack) {
              print(e);
              print(stack);
            }
          },
          child: const Text('Push Named'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const NavigationThreeScreen(),
              ),
            );
          },
          child: const Text('Push Replacement'),
        ),
        ElevatedButton(
          onPressed: () {
            try {
              // GoRouter 으로 실행 시, pushNamed Error 발생
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/${NavigationThreeScreen.routeName}',
                (route) =>
                    route.settings.name == '/${HomeScreen.routeName}',
              );
            } catch(e, stack) {
              print(e);
              print(stack);
            }
          },
          child: const Text('Push Named And Remove Until'),
        ),
      ],
    );
  }
}
