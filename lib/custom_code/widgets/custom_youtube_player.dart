// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatefulWidget {
  const CustomYoutubePlayer({
    Key? key,
    this.width,
    this.height,
    required this.initialVideoId,
    required this.onEnd,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String initialVideoId;
  final Future<dynamic> Function() onEnd;

  @override
  _CustomYoutubePlayerState createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.initialVideoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        // disableDragSeek: true,
      ),
    )..addListener(listener);
  }

  void listener() {
    var videoDuration = _controller.metadata.duration.inSeconds;
    var videoTimeToEnableButton = (videoDuration * 0.9).toInt();
    var currentVideoTime = _controller.value.position.inSeconds;

    print(currentVideoTime);

    print('Video time to enable button : $videoTimeToEnableButton');

    // Enable the button when 80% of the video is watched
    if (currentVideoTime >= videoTimeToEnableButton) {
      FFAppState().update(() {
        FFAppState().videoComplete = true;
      });
      widget.onEnd;
    } else {
      FFAppState().update(() {
        FFAppState().videoComplete = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onEnded: (metaData) {
            // Enable the button when the video ends
            FFAppState().update(() {
              FFAppState().videoComplete = true;
            });
            widget.onEnd;
          },
        ),
      ],
    );
  }
}
