# integrated_course1

Integrated code from Codefactory's Flutter course 1
----------
## 개요

인프런 플러터 강의 - [코드팩토리] [초급] Flutter 수강 완료 후 코드 통합 & 리팩토링

강의에서 챕터별로 진행된 각각의 프로젝트를 하나의 프로젝트로 코드 통합하고
통합 과정에서 필요한 리팩토링 작업이 적용된 프로젝트이다. 
통합 및 리팩토링 이유는 각각의 기능들을 추후 한 곳에서 쉽게 찾아보기 위한 목적에 있다.

네비게이터 방식 차이로 인해 빌드 방식으로 2개의 main 파일로 구분되므로 택일하여 run 한다.  
1. main.dart : 기본 Navigatior 적용
2. gorouter_main.dart : GoRouter 라이브러리 적용
----------
## 강의 주요 내용

Flutter 3.0 & 10개 프로젝트
+ Dart언어 마스터하기
+ Flutter로 예쁜 UI 제작하기
+ SQLite 데이터베이스 활용하기
+ 동영상 플레이어 앱 제작하기
+ 영상통화 앱 제작하기
+ 구글지도 사용하기
+ 위치서비스 사용하기
----------
## 리팩토링 내역

+ 각 챕터 별 분리된 프로젝트를 프로젝트 하나에서 확인 가능하도록 구현
+ 라우팅 방식 차이에 따른 main 함수 2개 적용
  + Navigator.of() 
  + GoRouter Library
+ 각 챕터 별 화면 선택 목록 화면 추가
+ libraries 최신 버전 상향
+ android > minSdkVersion 20 -> 21 상향
+ gitignore 개선
+ deprecated 개선
  + as is
    + > headline1, headline2, bodyText1, bodyText2, primary, onPrimary 등
  + to be
    + > displayLarge, displayMediumm, bodyLarge, bodyMedium, background, foreground 등
+ 저작권 이미지를 무료 이미지 대체
+ Google Map
  + API Key 정보는 ignore 관련 숨김 배포
  + ActionBar 
+ FutureBuilder & StreamBuilder 코드 분리
+ error 개선
  + video player > dispose 후 setState 사용 error 개선
----------
## 각 챕터 별 주요 기능
### 0. Home Screen

+ 각 챕터 별 코드를 한 화면에 통합하여 앱 내에서 확인 가능하도록 구현

+ Navigator
  + main.dart 빌드 - Router 기본 적용
  + gorouter_main 빌드 - GoRouter 적용
----------
### 1. Splash Screen

+ Asset & Image
+ Circular Progress Indicator 위젯
+ Timer
+ Navigator / popAndPushNamed
----------
### 2. Row Column Screen

+ Column + Row 위젯
+ MainAxisAlignment & crossAxisAlignment
+ MediaQuery.of(context).size - width & height
+ mainAxisSize
+ Expanded & Flexible
----------
### 3. WebView Screen

+ AppBar & actions
+ pub.dev > 외부 오픈소스 패키지
+ WebViewWidget
  + https://pub.dev/packages/webview_flutter
  + Javascript 권한 설정
  + Android Native 설정
  + HTTP 프로토콜 허용 설정 (android, ios)
----------
### 4. StatefulWidget & LifeCycle

+ 기본 생명주기
+ 파라미터가 바꼈을 때 생명주기
+ setState 실행을 때 생명주기
----------
### 5. PageView

+ Page View 위젯 & controller
+ Timer 클래스 & Page 전환
+ 상태바 색상 - dark / light
----------
### 5. D-day App

+ Font, Theme, textTheme
+ Date Picker
+ Date Time 클래스
+ Cupertino Dialog
----------
### 6. const 선언 + Constructor

+ const 선언에 따른 lifecycle
----------
### 7. Random Number Generator
   
+ Random()
+ Navigation - Navigator.of() & MaterialPageRoute
  + push / pop 
  + 데이터 전달 & async & await 
+ Slider 위젯
+ Functional 프로그래밍을 활용한 위젯 렌더링 및 코드정리
----------
### 8. Buttons

+ ElevatedButton
  + styleFrom
  + ButtonStyle & MaterialStateProperty
      + all
      + resolveWith & MaterialState
+ OutlinedButton
+ TextButton
----------
### 9. Navigation

+ Navigation & Stack
  + Navigator.of()
    + push / pushNamed / pushReplacement / pushNameAndRemoveUntil
    + pop / canPop / maybePop
    + argument 데이터 전달
      + MaterialPageRoute & RouteSettings
      + ModalRoute & settings.arguments
+ 공통 layout
----------
### 10. Video Player

+ libraries
  + video_player
  + image_picker
+ Stack 위젯
+ AspectRatio 위젯
+ Slider 위젯
+ Custom Video Controller
----------
### 11. 출석 체크 앱

+ libraries
  + google_maps_flutter
  + geolocator
+ Google Map
+ 위치 권한 체크
+ FutureBuilder
+ StreamBuilder
+ AlertDialog 위젯
+ AppBar Icon
----------
### 12. Future & Stream Builder

+ FutureBuilder
+ StreamBuilder
+ data caching & loading
+ snapshot
  + .connectionState : none / waiting / active / done
  + .data
  + .error
----------
### 13. 영상통화 앱

+ Agora API
+ RTC (Real Time Communication)
+ Shadow
+ Stack
----------
### 참조 링크

1. 강의 주소 - https://www.inflearn.com/course/플러터-프로젝트
2. 강의 코드
+ https://github.com/codefactory-co/flutter-lv1-project-hello-world.git
+ https://github.com/codefactory-co/flutter-lv1-project-splash-screen.git
+ https://github.com/codefactory-co/flutter-lv1-theory-row-and-column.git
+ https://github.com/codefactory-co/flutter-lv1-project-web-view.git
+ https://github.com/codefactory-co/flutter-v1-theory-statefulwidget.git
+ https://github.com/codefactory-co/flutter-lv1-project-image-carousel.git
+ https://github.com/codefactory-co/flutter-lv1-project-u-and-i.git
+ https://github.com/codefactory-co/flutter-lv1-project-random-number-generator.git
+ https://github.com/codefactory-co/flutter-lv1-theory-buttons.git
+ https://github.com/codefactory-co/flutter-lv1-theory-navigation.git
+ https://github.com/codefactory-co/flutter-lv1-project-video-player.git
+ https://github.com/codefactory-co/flutter-lv1-project-chool-check.git
+ https://github.com/codefactory-co/flutter-lv1-theory-future-and-stream-builder.git
+ https://github.com/codefactory-co/flutter-lv1-project-video-call-6.0.0.git