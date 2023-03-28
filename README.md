# integrated_course1

Integrated code from Codefactory's Flutter course 1

----------
## 개요
인프런 플러터 강의 - [코드팩토리] [초급] Flutter 수강 완료 후 코드 통합 & 리팩토링

참조 링크
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
+ 저작권 이미지를 무료 이미지 대체
+ 최신 버전 상향
+ deprecated 개선
  + as is
    + > headline1, headline2, bodyText1, bodyText2, primary, onPrimary 등
  + to be
    + > displayLarge, displayMediumm, bodyLarge, bodyMedium, background, foreground 등
+ gitignore 개선

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
