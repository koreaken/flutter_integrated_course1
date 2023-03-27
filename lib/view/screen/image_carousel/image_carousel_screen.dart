import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageCarouselScreen extends StatefulWidget {
  static String get routeName => 'image_carousel';

  const ImageCarouselScreen({Key? key}) : super(key: key);

  @override
  State<ImageCarouselScreen> createState() => _ImageCarouselScreenState();
}

class _ImageCarouselScreenState extends State<ImageCarouselScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }

      controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // AppBar 가 없을 때 상태바 글자 dark
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Carousel'),
        centerTitle: true,
        backgroundColor: Colors.transparent, // 투명 AppBar
        elevation: 0.0, // 그림자 농도 설정 (0은 제거)
        systemOverlayStyle: SystemUiOverlayStyle.dark, // 상태바 글자 dark
      ),
      extendBodyBehindAppBar: true, // body 위에 appbar
      body: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Image.asset(
                'asset/img/image_$e.jpg',
                fit: BoxFit.cover,
              ),
            )
            .toList(),
      ),
    );
  }
}
