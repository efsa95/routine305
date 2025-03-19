// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutDataStruct extends FFFirebaseStruct {
  WorkoutDataStruct({
    List<WorkoutStruct>? workout,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _workout = workout,
        super(firestoreUtilData);

  // "Workout" field.
  List<WorkoutStruct>? _workout;
  List<WorkoutStruct> get workout => _workout ?? const [];
  set workout(List<WorkoutStruct>? val) => _workout = val;

  void updateWorkout(Function(List<WorkoutStruct>) updateFn) {
    updateFn(_workout ??= []);
  }

  bool hasWorkout() => _workout != null;

  static WorkoutDataStruct fromMap(Map<String, dynamic> data) =>
      WorkoutDataStruct(
        workout: getStructList(
          data['Workout'],
          WorkoutStruct.fromMap,
        ),
      );

  static WorkoutDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkoutDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Workout': _workout?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Workout': serializeParam(
          _workout,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static WorkoutDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkoutDataStruct(
        workout: deserializeStructParam<WorkoutStruct>(
          data['Workout'],
          ParamType.DataStruct,
          true,
          structBuilder: WorkoutStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'WorkoutDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WorkoutDataStruct &&
        listEquality.equals(workout, other.workout);
  }

  @override
  int get hashCode => const ListEquality().hash([workout]);
}

WorkoutDataStruct createWorkoutDataStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkoutDataStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkoutDataStruct? updateWorkoutDataStruct(
  WorkoutDataStruct? workoutData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workoutData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkoutDataStructData(
  Map<String, dynamic> firestoreData,
  WorkoutDataStruct? workoutData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workoutData == null) {
    return;
  }
  if (workoutData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workoutData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workoutDataData =
      getWorkoutDataFirestoreData(workoutData, forFieldValue);
  final nestedData =
      workoutDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workoutData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkoutDataFirestoreData(
  WorkoutDataStruct? workoutData, [
  bool forFieldValue = false,
]) {
  if (workoutData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workoutData.toMap());

  // Add any Firestore field values
  workoutData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkoutDataListFirestoreData(
  List<WorkoutDataStruct>? workoutDatas,
) =>
    workoutDatas?.map((e) => getWorkoutDataFirestoreData(e, true)).toList() ??
    [];
