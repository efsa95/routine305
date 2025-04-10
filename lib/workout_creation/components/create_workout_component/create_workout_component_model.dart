import '/flutter_flow/flutter_flow_util.dart';
import 'create_workout_component_widget.dart' show CreateWorkoutComponentWidget;
import 'package:flutter/material.dart';

class CreateWorkoutComponentModel
    extends FlutterFlowModel<CreateWorkoutComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for getNameBox widget.
  FocusNode? getNameBoxFocusNode;
  TextEditingController? getNameBoxTextController;
  String? Function(BuildContext, String?)? getNameBoxTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    getNameBoxFocusNode?.dispose();
    getNameBoxTextController?.dispose();
  }
}
