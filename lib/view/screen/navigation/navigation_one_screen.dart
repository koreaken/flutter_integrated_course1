import 'package:flutter/material.dart';
import 'package:integrated_course1/view/layout/navigation_main_layout.dart';
import 'package:integrated_course1/view/screen/navigation/navigation_two_screen.dart';

class NavigationOneScreen extends StatelessWidget {
  static String get routeName => 'navigation_one';

  final int? number;

  const NavigationOneScreen({
    this.number,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationMainLayout(
      title: 'Navigation One',
      children: [
        Text(
          number.toString(),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: const Text('Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NavigationTwoScreen(),
                settings: const RouteSettings(
                  arguments: 789,
                )
              ),
            );
          },
          child: const Text('Push'),
        ),
      ],
    );
  }
}
