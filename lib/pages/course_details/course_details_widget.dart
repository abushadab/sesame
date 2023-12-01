import '/backend/api_requests/api_calls.dart';
import '/components/section_loading_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'course_details_model.dart';
export 'course_details_model.dart';

class CourseDetailsWidget extends StatefulWidget {
  const CourseDetailsWidget({
    super.key,
    int? courseId,
  })  : courseId = courseId ?? 1073;

  final int courseId;

  @override
  _CourseDetailsWidgetState createState() => _CourseDetailsWidgetState();
}

class _CourseDetailsWidgetState extends State<CourseDetailsWidget> {
  late CourseDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseDetailsModel());

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF1BBDEC),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1BBDEC),
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderWidth: 0.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).alternate,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('worlds');
            },
          ),
          title: Text(
            'Letter Ocean',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Atma',
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w800,
                ),
          ),
          actions: [
            Container(
              width: 80.0,
              height: 40.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: Image.asset(
                    'assets/images/scoring_1.png',
                  ).image,
                ),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.30, 0.00),
                child: Text(
                  '10',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Atma',
                        color: FlutterFlowTheme.of(context).warning,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/background.png',
                ).image,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: FutureBuilder<ApiCallResponse>(
                future: MsLmsGroup.sectionsCall.call(
                  token: '1|3b39b37cb9a70f5c018557f427416b67',
                  id: widget.courseId,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return const Center(
                      child: SectionLoadingWidget(),
                    );
                  }
                  final rowSectionsResponse = snapshot.data!;
                  return Builder(
                    builder: (context) {
                      final sec1 = MsLmsGroup.sectionsCall
                              .sections(
                                rowSectionsResponse.jsonBody,
                              )
                              ?.toList() ??
                          [];
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(sec1.length, (sec1Index) {
                            final sec1Item = sec1[sec1Index];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'coursesingle',
                                  queryParameters: {
                                    'sectionId': serializeParam(
                                      getJsonField(
                                        sec1Item,
                                        r'''$.id''',
                                      ),
                                      ParamType.int,
                                    ),
                                    'courseId': serializeParam(
                                      widget.courseId,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: 300.0,
                                height: 250.0,
                                constraints: const BoxConstraints(
                                  maxWidth: 300.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            3.0, 3.0, 3.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          child: Image.network(
                                            getJsonField(
                                              sec1Item,
                                              r'''$.img''',
                                            ),
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 8.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            getJsonField(
                                              sec1Item,
                                              r'''$.title''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: const Color(0xFF8A8A8A),
                                                ),
                                          ),
                                          Text(
                                            '3:00 Min',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: const Color(0xFF8A8A8A),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 220.0,
                                      child: Divider(
                                        thickness: 1.0,
                                        color: Color(0xFF8A8A8A),
                                      ),
                                    ),
                                    Text(
                                      'Feedback',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Text(
                                      'Fron 1 to 5',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 7.0,
                                          ),
                                    ),
                                    RatingBarIndicator(
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                      direction: Axis.horizontal,
                                      rating: functions
                                          .raingsStringtoDouble(getJsonField(
                                        sec1Item,
                                        r'''$.ratings''',
                                      ).toString()),
                                      unratedColor:
                                          FlutterFlowTheme.of(context).accent3,
                                      itemCount: 5,
                                      itemSize: 20.0,
                                    ),
                                  ].addToEnd(const SizedBox(height: 10.0)),
                                ),
                              ),
                            );
                          })
                              .divide(const SizedBox(width: 20.0))
                              .around(const SizedBox(width: 20.0)),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
