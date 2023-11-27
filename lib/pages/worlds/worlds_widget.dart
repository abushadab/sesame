import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'worlds_model.dart';
export 'worlds_model.dart';

class WorldsWidget extends StatefulWidget {
  const WorldsWidget({super.key});

  @override
  _WorldsWidgetState createState() => _WorldsWidgetState();
}

class _WorldsWidgetState extends State<WorldsWidget> {
  late WorldsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorldsModel());
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
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Background_Layer.png',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('splash_screen');
                        },
                        child: const Icon(
                          Icons.menu_outlined,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (context) {
                    if (() {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return false;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return false;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return true;
                      } else {
                        return true;
                      }
                    }()) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 320.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2D4687),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        3.0, 3.0, 3.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('world1');
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Image.asset(
                                          'assets/images/Layer_2.png',
                                          width: 320.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Big and Small Emotions',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Atma',
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ].addToEnd(const SizedBox(height: 20.0)),
                              ),
                            ),
                            Container(
                              width: 320.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2D4687),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        3.0, 3.0, 3.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('world1');
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Image.asset(
                                          'assets/images/Group_(5).png',
                                          width: 320.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'World of Mathematics',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Atma',
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ].addToEnd(const SizedBox(height: 20.0)),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(width: 20.0))
                              .around(const SizedBox(width: 20.0)),
                        ),
                      );
                    } else {
                      return Align(
                        alignment: const AlignmentDirectional(0.00, -1.00),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 320.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2D4687),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          3.0, 3.0, 3.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('world1');
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          child: Image.asset(
                                            'assets/images/Layer_2.png',
                                            width: 320.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Big and Small Emotions',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Atma',
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ].addToEnd(const SizedBox(height: 20.0)),
                                ),
                              ),
                              Container(
                                width: 320.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2D4687),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          3.0, 3.0, 3.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('world1');
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          child: Image.asset(
                                            'assets/images/Group_(5).png',
                                            width: 320.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'World of Mathematics',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Atma',
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ].addToEnd(const SizedBox(height: 20.0)),
                                ),
                              ),
                            ].divide(const SizedBox(height: 20.0)),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ].divide(const SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
