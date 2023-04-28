import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../const/agora.dart';

class CamScreen extends StatefulWidget {
  const CamScreen({Key? key}) : super(key: key);

  @override
  State<CamScreen> createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine;

  // 내 ID
  int? uid = 0;

  // 상대 ID
  int? otherUid;

  // 앱을 실행한 후 영상통화 테스트 연결 사이트를 통해 연결을 진행하면 한번만 연결이 되고 이후 연결은 안되는 문제가 있습니다.
  // 이 버그에대한 힌트는 위젯이 dispose 될때 engine에서 채널 나가기 및 폐기 처리가 안됐기 때문입니다.
  @override
  void dispose() async {
    super.dispose();
    // failed to call super.dispose.
    //
    // dispose() implementations must always call their superclass dispose() method,
    // to ensure that all the resources used by the widget are fully released
    //
    // super.dispose() 위에 선언하면 위 오류 메시지처럼 Exception caught 발생하므로
    // super.dispose() 후에 release 진행
    if (engine != null) {
      await engine!.leaveChannel();
      engine!.release();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LIVE'),
      ),
      body: FutureBuilder<bool>(
        future: init(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    renderMainView(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: Colors.grey,
                        width: 120,
                        height: 120,
                        child: renderSubView(),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (engine != null) {
                      await engine!.leaveChannel();
                    }

                    Navigator.of(context).pop();
                  },
                  child: const Text('채널 나가기'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  renderMainView() {
    if (uid == null) {
      return const Center(
        child: Text('채널에 참여해주세요.'),
      );
    } else {
      return AgoraVideoView(
        controller: VideoViewController(
          rtcEngine: engine!,
          canvas: const VideoCanvas(
            uid: 0,
          ),
        ),
      );
    }
  }

  renderSubView() {
    if (otherUid == null) {
      return const Center(
        child: Text('채널에 유저가 없습니다.'),
      );
    } else {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: engine!,
          canvas: VideoCanvas(
            uid: otherUid,
          ),
          connection: const RtcConnection(
            channelId: AGORA_CHANNEL_NAME,
          ),
        ),
      );
    }
  }

  Future<bool> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final microphonePermission = resp[Permission.microphone];

    if (cameraPermission != PermissionStatus.granted ||
        microphonePermission != PermissionStatus.granted) {
      throw '카메라 또는 마이크 권한이 없습니다.';
    }

    FlutterConfig.variables.forEach((key, value) {
      print('agora key:$key, value:$value');
    });

    if (engine == null) {
      engine = createAgoraRtcEngine();

      await engine!.initialize(
        RtcEngineContext(
          appId: FlutterConfig.get('AGORA_APP_ID'),
          // appId: AGORA_APP_ID,
        ),
      );

      engine!.registerEventHandler(
        RtcEngineEventHandler(
          // 내가 채널에 입장했을 때
          // connection -> 연결정보
          // elapsed -> 연결된 시간 (연결된지 얼마나 됐는지)
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
            print('채널에 입장했습니다. uid=${connection.localUid}');
            setState(() {
              uid = connection.localUid;
            });
          },
          // 내가 채널에서 나갔을 때
          onLeaveChannel: (RtcConnection connection, RtcStats stats) {
            print('채널 퇴장');
            setState(() {
              uid = null;
            });
          },
          // 상대방 유저가 들어왔을 때
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            print('상대가 채널에 입장했습니다. otherUid: $remoteUid');
            setState(() {
              otherUid = remoteUid;
            });
          },
          // 상대가 나갔을 때
          onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
            print('상대가 채널에서 나갔습니다. otherUid: $remoteUid');
            setState(() {
              otherUid = null;
            });
          },
        )
      );

      await engine!.enableVideo();
      await engine!.startPreview();

      ChannelMediaOptions options = const ChannelMediaOptions();
      await engine!.joinChannel(
        token: FlutterConfig.get('AGORA_TEMP_TOKEN'),
        // token: AGORA_TEMP_TOKEN,
        channelId: AGORA_CHANNEL_NAME,
        uid: 0,
        options: options,
      );
    }

    return true;
  }
}
