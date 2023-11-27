import '/components/gradient_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'splash_screen_widget.dart' show SplashScreenWidget;
import 'package:flutter/material.dart';

class SplashScreenModel extends FlutterFlowModel<SplashScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for GradientButton component.
  late GradientButtonModel gradientButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    gradientButtonModel = createModel(context, () => GradientButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    gradientButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
