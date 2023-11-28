import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'coursesingle_widget.dart' show CoursesingleWidget;
import 'package:flutter/material.dart';

class CoursesingleModel extends FlutterFlowModel<CoursesingleWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Query cache managers for this widget.

  final _h5pManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> h5p({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _h5pManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearH5pCache() => _h5pManager.clear();
  void clearH5pCacheKey(String? uniqueKey) =>
      _h5pManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearH5pCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
