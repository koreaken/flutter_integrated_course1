import 'package:flutter/material.dart';

import 'cam_screen.dart';

class VideoCallScreen extends StatelessWidget {
  static String get routeName => 'video_call';

  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call'),
      ),
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Expanded(
              child: _Logo(),
            ),
            Expanded(
              child: _Image(),
            ),
            Expanded(
              child: _Button(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300]!,
              blurRadius: 12.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.videocam,
                color: Colors.white,
                size: 40.0,
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                'LIVE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  letterSpacing: 4.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'asset/img/logo_flutter.png',
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const CamScreen(),
              ),
            );
          },
          child: const Text('입장하기'),
        ),
      ],
    );
  }
}
