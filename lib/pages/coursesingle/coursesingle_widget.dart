import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
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
                              context.safePop();
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 20.0),
                        child: Builder(
                          builder: (context) {
                            final materialList = MsLmsGroup.sectionsCall
                                    .materials(
                                      coursesingleSectionsResponse.jsonBody,
                                    )
                                    ?.where((e) =>
                                        widget.sectionId ==
                                        getJsonField(
                                          e,
                                          r'''$.section_id''',
                                        ))
                                    .toList()
                                    ?.toList() ??
                                [];
                            return SizedBox(
                              width: double.infinity,
                              height: 500.0,
                              child: PageView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage:
                                            min(0, materialList.length - 1)),
                                scrollDirection: Axis.horizontal,
                                itemCount: materialList.length,
                                itemBuilder: (context, materialListIndex) {
                                  final materialListItem =
                                      materialList[materialListIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if ((String type) {
                                        return type == "video";
                                      }(getJsonField(
                                        materialListItem,
                                        r'''$.type''',
                                      ).toString()))
                                        Expanded(
                                          child: Align(
                                            alignment: const AlignmentDirectional(
                                                0.00, -1.00),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: CourseSingleCall.call(
                                                token:
                                                    '1|3b39b37cb9a70f5c018557f427416b67',
                                                courseId: widget.courseId,
                                                itemId: getJsonField(
                                                  materialListItem,
                                                  r'''$.post_id''',
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final customYoutubePlayerCourseSingleResponse =
                                                    snapshot.data!;
                                                return SizedBox(
                                                  width: double.infinity,
                                                  height: 200.0,
                                                  child: custom_widgets
                                                      .CustomYoutubePlayer(
                                                    width: double.infinity,
                                                    height: 200.0,
                                                    initialVideoId:
                                                        CourseSingleCall
                                                            .videoid(
                                                      customYoutubePlayerCourseSingleResponse
                                                          .jsonBody,
                                                    ).toString(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      if ((String type) {
                                        return type == "text";
                                      }(getJsonField(
                                        materialListItem,
                                        r'''$.type''',
                                      ).toString()))
                                        Expanded(
                                          child: Align(
                                            alignment: const AlignmentDirectional(
                                                0.00, -1.00),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: CourseSingleCall.call(
                                                token:
                                                    '1|3b39b37cb9a70f5c018557f427416b67',
                                                courseId: widget.courseId,
                                                itemId: getJsonField(
                                                  materialListItem,
                                                  r'''$.post_id''',
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final webViewCourseSingleResponse =
                                                    snapshot.data!;
                                                return FlutterFlowWebView(
                                                  content:
                                                      '${CourseSingleCall.param(
                                                    webViewCourseSingleResponse
                                                        .jsonBody,
                                                  ).toString()}&token=179ac5aab1d709c477052aadb5fa69a070cd02393e0c7ed51dfaffd0ee76cd56b66136aa15dfee97ccd695dda87abef9219d8ca75ed6fbb1bba7aeb9fe2741af',
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  verticalScroll: false,
                                                  horizontalScroll: false,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (_model.pageViewCurrentIndex != 0)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                borderWidth: 0.0,
                                buttonSize: 40.0,
                                fillColor: const Color(0xFF9B0FFF),
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await _model.pageViewController?.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                  setState(() {});
                                },
                              ),
                            ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: !FFAppState().videoComplete
                                  ? null
                                  : () {
                                      print('Button pressed ...');
                                    },
                              text: 'Complete',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).success,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                elevation: 0.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                disabledTextColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              borderWidth: 0.0,
                              buttonSize: 40.0,
                              fillColor: const Color(0xFF9B0FFF),
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                if (_model.pageViewCurrentIndex >=
                                    valueOrDefault<int>(
                                      MsLmsGroup.sectionsCall
                                          .materials(
                                            coursesingleSectionsResponse
                                                .jsonBody,
                                          )
                                          .where((e) =>
                                              widget.sectionId ==
                                              getJsonField(
                                                e,
                                                r'''$.section_id''',
                                              ))
                                          .toList()
                                          .length,
                                      0,
                                    )) {
                                  context.pushNamed(
                                    'coursesingle',
                                    queryParameters: {
                                      'sectionId': serializeParam(
                                        widget.sectionId,
                                        ParamType.int,
                                      ),
                                      'courseId': serializeParam(
                                        widget.courseId,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  await _model.pageViewController?.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                  setState(() {});
                                }
                              },
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
        );
      },
    );
  }
}
