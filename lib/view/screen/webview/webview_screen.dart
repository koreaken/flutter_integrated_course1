import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// .... PlatformException .... 발생하면
/// 1. 터미널
///   flutter clean 실행
///   flutter pub get 실행
///
/// WebView 설정 - pub.dev 의 WebView 설정 안내에 따라
/// 1. build.gradle >
///   compileSdkVersion 32
///   minSdkVersion 20
/// 2. AndroidManifest.xml
///   <uses-permission android:name="android.permission.INTERNET"/>
///   <applicaton 내
///     android:usesCleartextTraffic="true" 속성 추가
/// 3. ios > Runner > Info.plist
///   NSAppTransportSecurity 대응 key, dict 추가

final homeUri = Uri.parse('https://github.com/koreaken');

class WebViewScreen extends StatelessWidget {
  static String get routeName => 'webview';

  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUri);

  WebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('WebView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // http://
              // https://
              controller.loadRequest(homeUri);
            },
            icon: const Icon(
              Icons.home,
            ),
          )
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
      // WebView( // old version
      //   onWebViewCreated: (WebViewController controller) {
      //     this.controller = controller;
      //   },
      //   initialUrl: homeUrl,
      //   javascriptMode: JavascriptMode.unrestricted,
      // ),
    );
  }
}
