import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilderScreen extends StatefulWidget {
  static String get routeName => 'future_builder';

  const FutureBuilderScreen({Key? key}) : super(key: key);

  @override
  State<FutureBuilderScreen> createState() => _FutureBuilderScreenState();
}

class _FutureBuilderScreenState extends State<FutureBuilderScreen> {
  final textStyle = const TextStyle(
    fontSize: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future & Stream Builder'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder(
              future: getNumber(),
              builder: (context, snapshot) {
                // 전체 화면의 새로고침 로딩 대신에 부분 로딩 이용 장점:
                // future & stream builder의 캐싱된 데이터가 여전히 볼 수 있도록

                // if (!snapshot.hasData) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }

                return _BuilderContents(
                    snapshot: snapshot,
                    textStyle: textStyle,
                    builderName: 'FutureBuilder');
              },
            ),
            const SizedBox(height: 32.0),
            StreamBuilder<int>(
              stream: streamNumbers(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData) {
                  // 데이터가 있을 때 위젯 렌더링
                }
                if (snapshot.hasError) {
                  // 에러가 났을 때 위젯 렌더링
                }

                // 로딩중일 때 위젯 렌더링

                return _BuilderContents(
                    snapshot: snapshot,
                    textStyle: textStyle,
                    builderName: 'StreamBuilder');
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text(
                'setState',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(const Duration(seconds: 3));

    final random = Random();

    return random.nextInt(100);
  }

  Stream<int> streamNumbers() async* {
    for (int i = 0; i < 10; i++) {
      if ( i == 5) {
        throw Exception('i = 5');
      }
      await Future.delayed(const Duration(seconds: 1));

      yield i;
    }
  }
}

class _BuilderContents extends StatelessWidget {
  final AsyncSnapshot<int> snapshot;
  final TextStyle textStyle;
  final String builderName;

  const _BuilderContents({
    required this.snapshot,
    required this.textStyle,
    required this.builderName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          builderName,
          style: textStyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        Text(
          'ConState: ${snapshot.connectionState}',
          style: textStyle,
        ),
        Row(
          children: [
            Text(
              'Data: ${snapshot.data}',
              style: textStyle,
            ),
            // 전체 화면의 새로고침 로딩 대신에 부분 로딩 이용 장점:
            // future & stream builder의 캐싱된 데이터가 여전히 볼 수 있도록
            if (snapshot.connectionState == ConnectionState.waiting)
              CircularProgressIndicator(),
          ],
        ),
        Text(
          'Error: ${snapshot.error}',
          style: textStyle,
        ),
      ],
    );
  }
}
