import 'package:flutter/material.dart';
import 'package:integrated_course1/view/layout/navigation_main_layout.dart';

class NavigationThreeScreen extends StatelessWidget {
  static String get routeName => 'navigation_three';

  const NavigationThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    return NavigationMainLayout(
      title: 'Navigation Three',
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
      ],
    );
  }
}
