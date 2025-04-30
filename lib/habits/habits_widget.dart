import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'habits_model.dart';
export 'habits_model.dart';

class HabitsWidget extends StatefulWidget {
  const HabitsWidget({super.key});

  static String routeName = 'habits';
  static String routePath = '/habits';

  @override
  State<HabitsWidget> createState() => _HabitsWidgetState();
}

class _HabitsWidgetState extends State<HabitsWidget> {
  late HabitsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HabitsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'habits'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HABITS_PAGE_habits_ON_INIT_STATE');
      logFirebaseEvent('habits_firestore_query');
      _model.habitsData = await queryHabitsRecordOnce(
        queryBuilder: (habitsRecord) => habitsRecord.where(
          'UserID',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.habitsData != null) {
        if (_model.habitsData!.lastCompleted >= functions.getYesterdayDate()!) {
          logFirebaseEvent('habits_update_page_state');
          _model.currentStreakDay = _model.habitsData!.habitsCounter;
          safeSetState(() {});
        } else {
          logFirebaseEvent('habits_backend_call');

          await _model.habitsData!.reference.update(createHabitsRecordData(
            habitsCounter: 0,
          ));
          logFirebaseEvent('habits_update_page_state');
          _model.currentStreakDay = 0;
          safeSetState(() {});
        }
      } else {
        logFirebaseEvent('habits_backend_call');

        var habitsRecordReference = HabitsRecord.collection.doc();
        await habitsRecordReference.set(createHabitsRecordData(
          habitsCounter: 0,
          lastCompleted: 1,
          userID: currentUserUid,
        ));
        _model.created = HabitsRecord.getDocumentFromData(
            createHabitsRecordData(
              habitsCounter: 0,
              lastCompleted: 1,
              userID: currentUserUid,
            ),
            habitsRecordReference);
        logFirebaseEvent('habits_update_page_state');
        _model.currentStreakDay = 0;
        safeSetState(() {});
      }
    });

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x19000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [Color(0xFF2797FF), Color(0xFFA52A2A)],
                        stops: [0.0, 0.7],
                        begin: AlignmentDirectional(1.0, -1.0),
                        end: AlignmentDirectional(-1.0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'Current Streak',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.outfit(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFFF0F5F9),
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.local_fire_department,
                                          color: Color(0xFFF0F5F9),
                                          size: 24.0,
                                        ),
                                        Text(
                                          '${_model.currentStreakDay.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFFF0F5F9),
                                                fontSize: 36.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            'days',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.manrope(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFF0F5F9),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => Text(
                    currentUserDisplayName,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: Color(0xFF161C24),
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x0D000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x4C2797FF),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.directions_run,
                                      color: Color(0xFFF0F5F9),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Did you run today?',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                            Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                unselectedWidgetColor: Color(0xFF636F81),
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue1 ??= false,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.checkboxValue1 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'HABITS_Checkbox_2g733e1k_ON_TOGGLE_ON');
                                    logFirebaseEvent(
                                        'Checkbox_firestore_query');
                                    _model.habits1 =
                                        await queryHabitsRecordOnce(
                                      queryBuilder: (habitsRecord) =>
                                          habitsRecord.where(
                                        'UserID',
                                        isEqualTo: currentUserUid,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (_model.habits1?.lastCompleted !=
                                        functions.getCurrentDate()) {
                                      logFirebaseEvent('Checkbox_backend_call');

                                      await _model.habits1!.reference.update({
                                        ...createHabitsRecordData(
                                          lastCompleted:
                                              functions.getCurrentDate(),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'HabitsCounter':
                                                FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                      logFirebaseEvent(
                                          'Checkbox_update_page_state');
                                      _model.currentStreakDay =
                                          _model.currentStreakDay + 1;
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  }
                                },
                                side: BorderSide(
                                  width: 2,
                                  color: Color(0xFF636F81),
                                ),
                                activeColor: Color(0xFF2797FF),
                                checkColor: Color(0xFFF0F5F9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x0D000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x4C2797FF),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.water_drop,
                                      color: Color(0xFFF0F5F9),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Did You Drink Water Today?',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                            Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                unselectedWidgetColor: Color(0xFF636F81),
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue2 ??= false,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.checkboxValue2 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'HABITS_Checkbox_2aoo2344_ON_TOGGLE_ON');
                                    logFirebaseEvent(
                                        'Checkbox_firestore_query');
                                    _model.habits2 =
                                        await queryHabitsRecordOnce(
                                      queryBuilder: (habitsRecord) =>
                                          habitsRecord.where(
                                        'UserID',
                                        isEqualTo: currentUserUid,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (_model.habits2?.lastCompleted !=
                                        functions.getCurrentDate()) {
                                      logFirebaseEvent('Checkbox_backend_call');

                                      await _model.habits2!.reference.update({
                                        ...createHabitsRecordData(
                                          lastCompleted:
                                              functions.getCurrentDate(),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'HabitsCounter':
                                                FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                      logFirebaseEvent(
                                          'Checkbox_update_page_state');
                                      _model.currentStreakDay =
                                          _model.currentStreakDay + 1;
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  }
                                },
                                side: BorderSide(
                                  width: 2,
                                  color: Color(0xFF636F81),
                                ),
                                activeColor: Color(0xFF2797FF),
                                checkColor: Color(0xFFF0F5F9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x0D000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x4C2797FF),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.fitness_center,
                                      color: Color(0xFFF0F5F9),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Did You Lift Weights Today?',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                            Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                unselectedWidgetColor: Color(0xFF636F81),
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue3 ??= false,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.checkboxValue3 = newValue!);
                                  if (newValue!) {
                                    logFirebaseEvent(
                                        'HABITS_Checkbox_oakps1z9_ON_TOGGLE_ON');
                                    logFirebaseEvent(
                                        'Checkbox_firestore_query');
                                    _model.habits3 =
                                        await queryHabitsRecordOnce(
                                      queryBuilder: (habitsRecord) =>
                                          habitsRecord.where(
                                        'UserID',
                                        isEqualTo: currentUserUid,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (_model.habits3?.lastCompleted !=
                                        functions.getCurrentDate()) {
                                      logFirebaseEvent('Checkbox_backend_call');

                                      await _model.habits3!.reference.update({
                                        ...createHabitsRecordData(
                                          lastCompleted:
                                              functions.getCurrentDate(),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'HabitsCounter':
                                                FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                      logFirebaseEvent(
                                          'Checkbox_update_page_state');
                                      _model.currentStreakDay =
                                          _model.currentStreakDay + 1;
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  }
                                },
                                side: BorderSide(
                                  width: 2,
                                  color: Color(0xFF636F81),
                                ),
                                activeColor: Color(0xFF2797FF),
                                checkColor: Color(0xFFF0F5F9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('HABITS_PAGE_ReturnButton_ON_TAP');
                    logFirebaseEvent('ReturnButton_navigate_to');

                    context.pushNamed(MainPageWidget.routeName);
                  },
                  text: 'Return',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 24.0))
                  .addToStart(SizedBox(height: 16.0))
                  .addToEnd(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
