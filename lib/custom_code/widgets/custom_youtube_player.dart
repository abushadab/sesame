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
  final double? width;
  final double? height;
  final String initialVideoId;
  final Future<dynamic> Function() onEnd;

  const CustomYoutubePlayer({
    Key? key,
    this.width,
    this.height,
    required this.initialVideoId,
    required this.onEnd,
  }) : super(key: key);

  @override
  _CustomYoutubePlayerState createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.initialVideoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: false,
      ),
    )..addListener(listener);
  }

  void listener() {
    if (_controller.value.isFullScreen != _isFullScreen) {
      setState(() {
        _isFullScreen = _controller.value.isFullScreen;
        if (_isFullScreen) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: []);
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: SystemUiOverlay.values);
        }
      });
    }

    if (_controller.value.position.inSeconds >=
        (_controller.metadata.duration.inSeconds * 0.9).toInt()) {
      FFAppState().update(() {
        FFAppState().videoComplete = true;
      });
      widget.onEnd();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      onEnded: (metaData) {
        FFAppState().update(() {
          FFAppState().videoComplete = true;
        });
        widget.onEnd();
      },
    );
  }
}
