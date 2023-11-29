import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'coursesingle_model.dart';
export 'coursesingle_model.dart';

class CoursesingleWidget extends StatefulWidget {
  const CoursesingleWidget({
    super.key,
    required this.sectionId,
    required this.courseId,
  });

  final int? sectionId;
  final int? courseId;

  @override
  _CoursesingleWidgetState createState() => _CoursesingleWidgetState();
}

class _CoursesingleWidgetState extends State<CoursesingleWidget> {
  late CoursesingleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursesingleModel());
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
      future: MsLmsGroup.sectionsCall.call(
        token: '1|3b39b37cb9a70f5c018557f427416b67',
        id: widget.courseId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final coursesingleSectionsResponse = snapshot.data!;
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
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Background_Layer.png',
                    ).image,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 5.0,
                            borderWidth: 0.0,
                            buttonSize: 40.0,
                            fillColor: FlutterFlowTheme.of(context).accent1,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
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
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter ??=
                                  Completer<ApiCallResponse>()
                                    ..complete(CourseSingleCall.call(
                                      token:
                                          '1|3b39b37cb9a70f5c018557f427416b67',
                                      courseId: widget.courseId,
                                      itemId:
                                          functions.returnFirstMetarialItemId(
                                              MsLmsGroup.sectionsCall
                                                  .materials(
                                                    coursesingleSectionsResponse
                                                        .jsonBody,
                                                  )!
                                                  .where((e) =>
                                                      widget.sectionId ==
                                                      getJsonField(
                                                        e,
                                                        r'''$.section_id''',
                                                      ))
                                                  .toList(),
                                              widget.sectionId!),
                                    )))
                              .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final columnCourseSingleResponse = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                custom_widgets.CustomYoutubePlayer(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.25,
                                  initialVideoId: CourseSingleCall.videoid(
                                    columnCourseSingleResponse.jsonBody,
                                  ).toString(),
                                  onEnd: () async {
                                    _model.apiResultts7 = await MsLmsGroup
                                        .completeALessonCall
                                        .call(
                                      courseId: widget.courseId,
                                      itemId:
                                          functions.returnFirstMetarialItemId(
                                              MsLmsGroup.sectionsCall
                                                  .materials(
                                                    coursesingleSectionsResponse
                                                        .jsonBody,
                                                  )!
                                                  .where((e) =>
                                                      widget.sectionId ==
                                                      getJsonField(
                                                        e,
                                                        r'''$.section_id''',
                                                      ))
                                                  .toList(),
                                              widget.sectionId!),
                                      token:
                                          '1|3b39b37cb9a70f5c018557f427416b67',
                                    );
                                    if ((_model.apiResultts7?.succeeded ??
                                        true)) {
                                      setState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                    }

                                    setState(() {});
                                  },
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (CourseSingleCall.previousLessonId(
                                            columnCourseSingleResponse.jsonBody,
                                          ) !=
                                          null)
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              borderWidth: 0.0,
                                              buttonSize: 40.0,
                                              fillColor: const Color(0xFF9B0FFF),
                                              icon: Icon(
                                                Icons
                                                    .arrow_back_ios_new_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                context.safePop();
                                              },
                                            ),
                                          ),
                                        ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 8.0,
                                            borderWidth: 0.0,
                                            buttonSize: 40.0,
                                            fillColor: const Color(0xFF9B0FFF),
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 24.0,
                                            ),
                                            showLoadingIndicator: true,
                                            onPressed: () async {
                                              setState(() => _model
                                                  .apiRequestCompleter = null);
                                              await _model
                                                  .waitForApiRequestCompleted();
                                              if (CourseSingleCall.completed(
                                                columnCourseSingleResponse
                                                    .jsonBody,
                                              )) {
                                                if (CourseSingleCall
                                                        .nextlessontype(
                                                      columnCourseSingleResponse
                                                          .jsonBody,
                                                    ).toString() ==
                                                    'text') {
                                                  context.pushNamed(
                                                    'h5pContent',
                                                    queryParameters: {
                                                      'sectionid':
                                                          serializeParam(
                                                        widget.sectionId,
                                                        ParamType.int,
                                                      ),
                                                      'courseid':
                                                          serializeParam(
                                                        widget.courseId,
                                                        ParamType.int,
                                                      ),
                                                      'lessonId':
                                                          serializeParam(
                                                        CourseSingleCall
                                                            .nextlesson(
                                                          columnCourseSingleResponse
                                                              .jsonBody,
                                                        ),
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please complete this lesson first',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .warning,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
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
