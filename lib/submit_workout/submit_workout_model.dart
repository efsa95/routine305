import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'submit_workout_widget.dart' show SubmitWorkoutWidget;
import 'package:flutter/material.dart';

class SubmitWorkoutModel extends FlutterFlowModel<SubmitWorkoutWidget> {
  ///  Local state fields for this page.

  bool isExpanded = true;

  String selectedWCategoryFromText = 'NoTextSelected';

  String? selectedExerciseFromText;

  DocumentReference? currentWorkoutDocRef;

  int exerciseReps = 0;

  int exerciseWeight = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in SubmitWorkout widget.
  CurrentWorkoutRecord? queriedCurrentDocument;
  // Stores action output result for [Backend Call - Create Document] action in SubmitWorkout widget.
  CurrentWorkoutRecord? newCurrentWorkoutDocument;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
