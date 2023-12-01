import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video_player_page_widget.dart' show VideoPlayerPageWidget;
import 'package:flutter/material.dart';

class VideoPlayerPageModel extends FlutterFlowModel<VideoPlayerPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Complete A Lesson)] action in CustomYoutubePlayer widget.
  ApiCallResponse? apiResultffw;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
