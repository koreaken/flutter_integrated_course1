import 'package:flutter/material.dart';

// https://github.com/codefactory-co/flutter-lv1-theory-row-and-column.git
class RowColumnScreen extends StatelessWidget {
  static String get routeName => 'row_column';
  const RowColumnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row Column'),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.black,
          child: Column(
            // MainAxisAlignment - 주측 정렬
            // start - 시작
            // end - 끝
            // center - 가운데
            // spaceBetween - 위젯과 위젯의 사이가 동일하게 배치된다.
            // spaceEvenly - 위젯을 같은 간격으로 배치하지만 끝과 끝에도
            //              위젯이 아닌 빈 간격으로 시작한다.
            // spaceAround - spaceEvenly + 끝과 끝의 간격은 1/2
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // CrossAxisAllignment - 반대측 정렬
            // start - 시작
            // end - 끝
            // center - 가운데
            // stretch - 최대한으로 늘린.
            crossAxisAlignment: CrossAxisAlignment.start,
            // MainAxisSize - 주축 크기
            // max - 최대
            // min - 최소
            mainAxisSize: MainAxisSize.min,
            children: [
              // Expanded & Flexible - Column 과 Row 안에 반드시 사용
              // Expanded - 남은 영역을 모두 차지한다.
              // Flexible - 비율만큼 공간을 차지하되 자기 공간 외를 버린다.
              //    - 속성 flex
              //        - default: 1
              //        - 나머지 공간을 차지하는 비율
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.orange,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.yellow,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.green,
                      width: 50.0,
                      height: 50.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.orange,
                  width: 50.0,
                  height: 50.0,
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.orange,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.yellow,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.green,
                      width: 50.0,
                      height: 50.0,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.green,
                width: 50.0,
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
