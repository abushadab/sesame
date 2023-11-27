import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'worksheet_model.dart';
export 'worksheet_model.dart';

class WorksheetWidget extends StatefulWidget {
  const WorksheetWidget({super.key});

  @override
  _WorksheetWidgetState createState() => _WorksheetWidgetState();
}

class _WorksheetWidgetState extends State<WorksheetWidget> {
  late WorksheetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorksheetModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Background_Layer.png',
                ).image,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Text(
                    'Worksheet',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Atma',
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: Container(
                              width: 166.0,
                              height: 240.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFF142E73),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 3.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.00, -1.00),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Clip_path_group.png',
                                          width: 134.0,
                                          height: 133.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 120.0, 0.0, 0.0),
                                      child: Text(
                                        'Big & Small Emotions',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Atma',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-0.00, 1.15),
                                    child: Container(
                                      width: 72.0,
                                      height: 34.0,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 6.0,
                                            color: Color(0x33000000),
                                            offset: Offset(2.0, 3.0),
                                            spreadRadius: 5.0,
                                          )
                                        ],
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF64AD00),
                                            Color(0xFFB2E800)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, 0.34),
                                          end:
                                              AlignmentDirectional(-1.0, -0.34),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(31.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          'View',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Atma',
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 166.0,
                          height: 240.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF142E73),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(2.0, 2.0),
                                spreadRadius: 3.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.00, -1.00),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Clip_path_group_(1).png',
                                      width: 134.0,
                                      height: 133.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 120.0, 0.0, 0.0),
                                  child: Text(
                                    'World of Maths',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Atma',
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-0.00, 1.15),
                                child: Container(
                                  width: 72.0,
                                  height: 34.0,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 6.0,
                                        color: Color(0x33000000),
                                        offset: Offset(2.0, 3.0),
                                        spreadRadius: 5.0,
                                      )
                                    ],
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF64AD00),
                                        Color(0xFFB2E800)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(1.0, 0.34),
                                      end: AlignmentDirectional(-1.0, -0.34),
                                    ),
                                    borderRadius: BorderRadius.circular(31.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'View',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Atma',
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: Container(
                              width: 166.0,
                              height: 240.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFF142E73),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 3.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.00, -1.00),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Clip_path_group.png',
                                          width: 134.0,
                                          height: 133.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 120.0, 0.0, 0.0),
                                      child: Text(
                                        'Life Skills',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Atma',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-0.00, 1.15),
                                    child: Container(
                                      width: 72.0,
                                      height: 34.0,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 6.0,
                                            color: Color(0x33000000),
                                            offset: Offset(2.0, 3.0),
                                            spreadRadius: 5.0,
                                          )
                                        ],
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF64AD00),
                                            Color(0xFFB2E800)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, 0.34),
                                          end:
                                              AlignmentDirectional(-1.0, -0.34),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(31.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          'View',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Atma',
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 166.0,
                          height: 240.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF142E73),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(2.0, 2.0),
                                spreadRadius: 3.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.00, -1.00),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Clip_path_group_(1).png',
                                      width: 134.0,
                                      height: 133.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 120.0, 0.0, 0.0),
                                  child: Text(
                                    'Letter Ocean',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Atma',
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-0.00, 1.15),
                                child: Container(
                                  width: 72.0,
                                  height: 34.0,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 6.0,
                                        color: Color(0x33000000),
                                        offset: Offset(2.0, 3.0),
                                        spreadRadius: 5.0,
                                      )
                                    ],
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF64AD00),
                                        Color(0xFFB2E800)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(1.0, 0.34),
                                      end: AlignmentDirectional(-1.0, -0.34),
                                    ),
                                    borderRadius: BorderRadius.circular(31.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'View',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Atma',
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
