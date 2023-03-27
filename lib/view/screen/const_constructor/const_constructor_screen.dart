import 'package:flutter/material.dart';

class ConstConstructorScreen extends StatefulWidget {
  static String get routeName => 'const_constructor';

  const ConstConstructorScreen({Key? key}) : super(key: key);

  @override
  State<ConstConstructorScreen> createState() => _ConstConstructorScreenState();
}

class _ConstConstructorScreenState extends State<ConstConstructorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Const Constructor'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _TextWidget(label: 'test1'),
            _TextWidget(label: 'test2'),
            ElevatedButton(
              onPressed: () {
                setState(() {

                });
              },
              child: const Text('빌드!'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String label;

  const _TextWidget({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('$label build 실행!');

    return Container(
      child: Text(
        label,
      ),
    );
  }
}
