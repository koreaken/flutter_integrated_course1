import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static String get routeName => 'buttons';

  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('버튼'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                // MaterialState
                // MaterialState.hovered
                // MaterialState.focused
                // MaterialState.pressed (버튼에서 사용)
                // MaterialState.dragged
                // MaterialState.selected (버튼에서 사용)
                // MaterialState.scrollUnder
                // MaterialState.disabled
                // MaterialState.error
                backgroundColor: MaterialStateProperty.all(Colors.black),
                foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.white;
                    }
                    return Colors.red;
                  },
                ),
                padding: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const EdgeInsets.all(100.0);
                    }
                    return const EdgeInsets.all(20.0);
                  },
                ),
              ),
              child: const Text('ButtonStyle'),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                // primary - 메인 칼라
                backgroundColor: Colors.red,
                // onPrimary - 글자 및 ripple 애니메이션 색상
                foregroundColor: Colors.black,
                // 그림자 색상
                shadowColor: Colors.green,
                // 3D 입체감의 높이
                elevation: 10.0,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
                padding: const EdgeInsets.all(32.0),
                side: const BorderSide(),
              ),
              child: const Text('ElevatedButton'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                // 글자 및 아웃라인 색상
                foregroundColor: Colors.green,
                // 배경 쓸거면 ElevatedButton 을 쓰자
                backgroundColor: Colors.yellow,
                // elevation 쓸거면 ElevatedButton 을 쓰자
                elevation: 10.0,
              ),
              child: const Text('OutlinedButton'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.brown,
                backgroundColor: Colors.blue,
              ),
              child: const Text('TextButton'),
            ),
          ],
        ),
      ),
    );
  }
}
