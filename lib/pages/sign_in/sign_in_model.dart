import '/backend/api_requests/api_calls.dart';
import '/components/gradient_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sign_in_widget.dart' show SignInWidget;
import 'package:flutter/material.dart';

class SignInModel extends FlutterFlowModel<SignInWidget> {
  ///  Local state fields for this page.

  bool otpRequest = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? _phoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please Enter a Valid Phone Numberx';
    }

    if (val.length < 8) {
      return 'Please Enter a Valid Phone Number';
    }
    if (val.length > 11) {
      return 'Please Enter a Valid Phone Number';
    }

    return null;
  }

  // State field(s) for otp widget.
  FocusNode? otpFocusNode;
  TextEditingController? otpController;
  String? Function(BuildContext, String?)? otpControllerValidator;
  // Model for GradientButton component.
  late GradientButtonModel gradientButtonModel1;
  // Stores action output result for [Backend Call - API (sendotp)] action in GradientButton widget.
  ApiCallResponse? apiResult1s9;
  // Model for GradientButton component.
  late GradientButtonModel gradientButtonModel2;
  // Stores action output result for [Backend Call - API (verifyotp)] action in GradientButton widget.
  ApiCallResponse? verifyOtp;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
    gradientButtonModel1 = createModel(context, () => GradientButtonModel());
    gradientButtonModel2 = createModel(context, () => GradientButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    otpFocusNode?.dispose();
    otpController?.dispose();

    gradientButtonModel1.dispose();
    gradientButtonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
