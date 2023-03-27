import 'package:flutter/material.dart';

class StatefulWidgetScreen extends StatefulWidget {
  final Color color;

  StatefulWidgetScreen({
    required this.color,
    Key? key,
  }) : super(key: key) {
    print('Widget Constructor 실행~!');
  }

  @override
  State<StatefulWidgetScreen> createState() {
    print('createState 실행!');
    return _StatefulWidgetScreenState();
  }
}

class _StatefulWidgetScreenState extends State<StatefulWidgetScreen> {
  int number = 0;

  @override
  void initState() {
    print('initState 실행!');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies 실행!');
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print('deactivate 실행!');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose 실행!');
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant StatefulWidgetScreen oldWidget) {
    print('didUpdateWidget 실행!');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('build 실행!');

    return GestureDetector(
      onTap: () {
        setState(() {
          number++;
        });
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        color: widget.color,
        child: Center(
          child: Text(number.toString()),
        ),
      ),
    );
  }
}
