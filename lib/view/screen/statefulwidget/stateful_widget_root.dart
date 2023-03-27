import 'package:flutter/material.dart';

import 'stateful_widget_screen.dart';

class StatefulWidgetRoot extends StatefulWidget {
  static String get routeName => 'stateful_widget_root';
  const StatefulWidgetRoot({Key? key}) : super(key: key);

  @override
  State<StatefulWidgetRoot> createState() => _StatefulWidgetRootState();
}

class _StatefulWidgetRootState extends State<StatefulWidgetRoot> {
  Color color = Colors.blue;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefulWidget'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: show ? StatefulWidgetScreen(color: color) : Container(),
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        color = color == Colors.red ? Colors.blue : Colors.red;
                      });
                    },
                    child: Text(
                      '색깔 변경하기',
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    child: Text(
                      !show ? '위젯 생성하기' : '위젯 삭제하기',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
