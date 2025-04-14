import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'run_tracker_model.dart';
export 'run_tracker_model.dart';

class RunTrackerWidget extends StatefulWidget {
  const RunTrackerWidget({super.key});

  static String routeName = 'RunTracker';
  static String routePath = '/runTracker';

  @override
  State<RunTrackerWidget> createState() => _RunTrackerWidgetState();
}

class _RunTrackerWidgetState extends State<RunTrackerWidget> {
  late RunTrackerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RunTrackerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'RunTracker'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF9DA2AA),
        appBar: AppBar(
          backgroundColor: Color(0xFF3A3D46),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Text(
              'RUN TRACKER',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 40.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0xFF150303),
                          offset: Offset(
                            4.0,
                            8.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Color(0xFF4A0000),
                        width: 1.0,
                      ),
                    ),
                    child: AuthUserStreamWidget(
                      builder: (context) => FlutterFlowGoogleMap(
                        controller: _model.googleMapsController,
                        onCameraIdle: (latLng) =>
                            _model.googleMapsCenter = latLng,
                        initialLocation: _model.googleMapsCenter ??=
                            currentUserDocument!.locationData!,
                        markerColor: GoogleMarkerColor.violet,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 14.0,
                        allowInteraction: false,
                        allowZoom: false,
                        showZoomControls: false,
                        showLocation: true,
                        showCompass: false,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0xFF4A0000),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Distance',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  '0.00 km',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 28.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Time',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                FlutterFlowTimer(
                                  initialTime: _model.timerInitialTimeMs,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(value,
                                          milliSecond: false),
                                  controller: _model.timerController,
                                  updateStateInterval:
                                      Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timerMilliseconds = value;
                                    _model.timerValue = displayTime;
                                    if (shouldUpdate) safeSetState(() {});
                                  },
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 28.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pace',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  '0:00 /km',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 28.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF3A3D46),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0xFF150303),
                        offset: Offset(
                          4.0,
                          8.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0xFF4A0000),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('StartButton pressed ...');
                            },
                            text: 'START',
                            options: FFButtonOptions(
                              width: 150.0,
                              height: 60.0,
                              padding: EdgeInsets.all(8.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFA52A2A),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0xFF4A0000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () {
                            print('PauseButton pressed ...');
                          },
                          text: 'PAUSE',
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 60.0,
                            padding: EdgeInsets.all(8.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF3A3D46),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Color(0xFF4A0000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
