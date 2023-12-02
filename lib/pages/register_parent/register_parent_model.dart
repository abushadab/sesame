import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'register_parent_widget.dart' show RegisterParentWidget;
import 'package:flutter/material.dart';

class RegisterParentModel extends FlutterFlowModel<RegisterParentWidget> {
  ///  Local state fields for this page.

  bool otp = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for otp widget.
  FocusNode? otpFocusNode;
  TextEditingController? otpController;
  String? Function(BuildContext, String?)? otpControllerValidator;
  // Stores action output result for [Backend Call - API (sendotp for register)] action in Container widget.
  ApiCallResponse? otpSend;
  // Stores action output result for [Backend Call - API (Signup for parent)] action in Container widget.
  ApiCallResponse? createAccount;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    otpFocusNode?.dispose();
    otpController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
