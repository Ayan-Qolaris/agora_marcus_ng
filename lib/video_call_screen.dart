import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: 'eaa99c73aeff4446b2e8ef2f5c8c42c1',
      channelName: 'voyant',
      tempToken:
          '007eJxTYBDwKPnEkTSxQUclWnJ6ttD3y6+31+l+DpLS+raq4PxVNk4FhtTEREvLZHPjxNS0NBMTE7Mko1SL1DSjNNNki2QTo2TDjWo7UxoCGRmSHxuwMjJAIIjPxlCWX5mYV8LAAABLdh/+',
    ),
  );

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await _client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(client: _client),
              AgoraVideoButtons(client: _client),
            ],
          ),
        ),
      ),
    );
  }
}
