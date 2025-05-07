import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'habits_widget.dart' show HabitsWidget;
import 'package:flutter/material.dart';

class HabitsModel extends FlutterFlowModel<HabitsWidget> {
  ///  Local state fields for this page.

  int currentStreakDay = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in habits widget.
  HabitsRecord? habitsData;
  // Stores action output result for [Backend Call - Create Document] action in habits widget.
  HabitsRecord? created;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // Stores action output result for [Firestore Query - Query a collection] action in Checkbox widget.
  HabitsRecord? habits1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // Stores action output result for [Firestore Query - Query a collection] action in Checkbox widget.
  HabitsRecord? habits2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // Stores action output result for [Firestore Query - Query a collection] action in Checkbox widget.
  HabitsRecord? habits3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
