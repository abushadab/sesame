import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gradient_button_model.dart';
export 'gradient_button_model.dart';

class GradientButtonWidget extends StatefulWidget {
  const GradientButtonWidget({
    super.key,
    required this.buttonText,
  });

  final String? buttonText;

  @override
  _GradientButtonWidgetState createState() => _GradientButtonWidgetState();
}

class _GradientButtonWidgetState extends State<GradientButtonWidget> {
  late GradientButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GradientButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 212.0,
      height: 72.0,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF5A00), Color(0xFFFFC600)],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        borderRadius: BorderRadius.circular(36.0),
        border: Border.all(
          color: const Color(0xFF5E719F),
          width: 4.0,
        ),
      ),
      alignment: const AlignmentDirectional(0.00, 0.00),
      child: Align(
        alignment: const AlignmentDirectional(0.00, 0.00),
        child: Text(
          widget.buttonText!,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Atma',
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
