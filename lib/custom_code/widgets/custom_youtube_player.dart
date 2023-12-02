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
import '/flutter_flow/flutter_flow_util.dart' show routeObserver;

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

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer>
    with RouteAware {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.initialVideoId,
      flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          enableCaption: false,
          disableDragSeek: true),
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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPushNext() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
  }

  @override
  void didPopNext() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
  }

  @override
  void deactivate() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _controller.removeListener(listener);
    _controller.dispose();
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
