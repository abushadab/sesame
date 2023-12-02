import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
        return YoutubeFullScreenWrapper(
          child: GestureDetector(
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
                        'assets/images/background.png',
                      ).image,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
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
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.00, 0.00),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'VideoPlayerPage',
                                            queryParameters: {
                                              'videoId': serializeParam(
                                                CourseSingleCall.videoid(
                                                  columnCourseSingleResponse
                                                      .jsonBody,
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'courseId': serializeParam(
                                                widget.courseId,
                                                ParamType.int,
                                              ),
                                              'itemId': serializeParam(
                                                functions
                                                    .returnFirstMetarialItemId(
                                                        MsLmsGroup.sectionsCall
                                                            .materials(
                                                              coursesingleSectionsResponse
                                                                  .jsonBody,
                                                            )!
                                                            .where((e) =>
                                                                widget
                                                                    .sectionId ==
                                                                getJsonField(
                                                                  e,
                                                                  r'''$.section_id''',
                                                                ))
                                                            .toList(),
                                                        widget.sectionId!),
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  CourseSingleCall.postar(
                                                    columnCourseSingleResponse
                                                        .jsonBody,
                                                  ),
                                                  width: 350.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Icon(
                                                Icons.play_circle_rounded,
                                                color: Color(0x99FFFFFF),
                                                size: 70.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                    'sectionid': serializeParam(
                                                      widget.sectionId,
                                                      ParamType.int,
                                                    ),
                                                    'courseid': serializeParam(
                                                      widget.courseId,
                                                      ParamType.int,
                                                    ),
                                                    'lessonId': serializeParam(
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
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/forward_btn.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 10.0)),
                                    ),
                                  ),
                                  if (false)
                                    const FlutterFlowYoutubePlayer(
                                      url:
                                          'https://www.youtube.com/watch?v=C30hQ0ZSFoM',
                                      autoPlay: false,
                                      looping: true,
                                      mute: true,
                                      showControls: true,
                                      showFullScreen: true,
                                      strictRelatedVideos: false,
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
          ),
        );
      },
    );
  }
}
