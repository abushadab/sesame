import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'h5p_content_model.dart';
export 'h5p_content_model.dart';

class H5pContentWidget extends StatefulWidget {
  const H5pContentWidget({
    super.key,
    this.sectionid,
    this.courseid,
    this.lessonDetails,
    this.lessonId,
  });

  final int? sectionid;
  final int? courseid;
  final dynamic lessonDetails;
  final int? lessonId;

  @override
  _H5pContentWidgetState createState() => _H5pContentWidgetState();
}

class _H5pContentWidgetState extends State<H5pContentWidget> {
  late H5pContentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => H5pContentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.setLandscapeMode();
    });
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

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(CourseSingleCall.call(
              token: '1|3b39b37cb9a70f5c018557f427416b67',
              courseId: widget.courseid,
              itemId: widget.lessonId,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0x004B39EF),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final h5pContentCourseSingleResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0x004B39EF),
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: const AlignmentDirectional(1.00, 0.00),
                    image: Image.asset(
                      'assets/images/background.png',
                    ).image,
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FlutterFlowWebView(
                            content: '${CourseSingleCall.param(
                              h5pContentCourseSingleResponse.jsonBody,
                            ).toString()}&token=179ac5aab1d709c477052aadb5fa69a070cd02393e0c7ed51dfaffd0ee76cd56b66136aa15dfee97ccd695dda87abef9219d8ca75ed6fbb1bba7aeb9fe2741af',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            verticalScroll: false,
                            horizontalScroll: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Image.asset(
                                  'assets/images/back_btn.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(
                                      () => _model.apiRequestCompleter = null);
                                  await _model.waitForApiRequestCompleted(
                                      minWait: 500);
                                  if (CourseSingleCall.completed(
                                    h5pContentCourseSingleResponse.jsonBody,
                                  )) {
                                    if (CourseSingleCall.nextlessonavailable(
                                      h5pContentCourseSingleResponse.jsonBody,
                                    )) {
                                      if (CourseSingleCall.nextlessontype(
                                            h5pContentCourseSingleResponse
                                                .jsonBody,
                                          ).toString() ==
                                          'video') {
                                        context.pushNamed(
                                          'coursesingle',
                                          queryParameters: {
                                            'sectionId': serializeParam(
                                              widget.sectionid! + 1,
                                              ParamType.int,
                                            ),
                                            'courseId': serializeParam(
                                              widget.courseid,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        context.pushNamed(
                                          'h5pContent',
                                          queryParameters: {
                                            'sectionid': serializeParam(
                                              widget.sectionid,
                                              ParamType.int,
                                            ),
                                            'courseid': serializeParam(
                                              widget.courseid,
                                              ParamType.int,
                                            ),
                                            'lessonId': serializeParam(
                                              CourseSingleCall.nextlesson(
                                                h5pContentCourseSingleResponse
                                                    .jsonBody,
                                              ),
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    } else {
                                      context.pushNamed(
                                        'CourseDetails',
                                        queryParameters: {
                                          'courseId': serializeParam(
                                            widget.courseid,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please complete this lesson first',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .warning,
                                      ),
                                    );
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/forward_btn.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 10.0)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 0.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            'CourseDetails',
                            queryParameters: {
                              'courseId': serializeParam(
                                1073,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
