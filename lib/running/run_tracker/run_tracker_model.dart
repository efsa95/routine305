import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'run_tracker_widget.dart' show RunTrackerWidget;
import 'package:flutter/material.dart';

class RunTrackerModel extends FlutterFlowModel<RunTrackerWidget> {
  ///  Local state fields for this page.
  /// Tracks run time in seconds
  int? runningTime = 0;

  /// total distance of the run (miles)
  double? runDistance = 0.0;

  /// store the route points
  List<LatLng> locationPoints = [];
  void addToLocationPoints(LatLng item) => locationPoints.add(item);
  void removeFromLocationPoints(LatLng item) => locationPoints.remove(item);
  void removeAtIndexFromLocationPoints(int index) =>
      locationPoints.removeAt(index);
  void insertAtIndexInLocationPoints(int index, LatLng item) =>
      locationPoints.insert(index, item);
  void updateLocationPointsAtIndex(int index, Function(LatLng) updateFn) =>
      locationPoints[index] = updateFn(locationPoints[index]);

  /// to show/hide certain buttons
  bool isRunning = false;

  LatLng? currentLocation;

  String runPace = 'pace';

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
    instantTimer?.cancel();
  }
}
