import '/flutter_flow/flutter_flow_util.dart';
import 'add_exercise_component_widget.dart' show AddExerciseComponentWidget;
import 'package:flutter/material.dart';

class AddExerciseComponentModel
    extends FlutterFlowModel<AddExerciseComponentWidget> {
  ///  Local state fields for this component.
  /// meant to be passed into exercise collection
  String wName = 'none';

  ///  State fields for stateful widgets in this component.

  // State field(s) for getNameBox widget.
  FocusNode? getNameBoxFocusNode;
  TextEditingController? getNameBoxTextController;
  String? Function(BuildContext, String?)? getNameBoxTextControllerValidator;
  // State field(s) for getRepsBox widget.
  FocusNode? getRepsBoxFocusNode;
  TextEditingController? getRepsBoxTextController;
  String? Function(BuildContext, String?)? getRepsBoxTextControllerValidator;
  // State field(s) for getSetsBox widget.
  FocusNode? getSetsBoxFocusNode;
  TextEditingController? getSetsBoxTextController;
  String? Function(BuildContext, String?)? getSetsBoxTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    getNameBoxFocusNode?.dispose();
    getNameBoxTextController?.dispose();

    getRepsBoxFocusNode?.dispose();
    getRepsBoxTextController?.dispose();

    getSetsBoxFocusNode?.dispose();
    getSetsBoxTextController?.dispose();
  }
}
