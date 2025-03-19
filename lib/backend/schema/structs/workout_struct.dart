// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutStruct extends FFFirebaseStruct {
  WorkoutStruct({
    String? exercise,
    String? weightAmount,
    List<SetsStruct>? sets,
    String? startTime,
    String? endTime,
    String? elapsedTime,
    String? restTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _exercise = exercise,
        _weightAmount = weightAmount,
        _sets = sets,
        _startTime = startTime,
        _endTime = endTime,
        _elapsedTime = elapsedTime,
        _restTime = restTime,
        super(firestoreUtilData);

  // "Exercise" field.
  String? _exercise;
  String get exercise => _exercise ?? '';
  set exercise(String? val) => _exercise = val;

  bool hasExercise() => _exercise != null;

  // "WeightAmount" field.
  String? _weightAmount;
  String get weightAmount => _weightAmount ?? '';
  set weightAmount(String? val) => _weightAmount = val;

  bool hasWeightAmount() => _weightAmount != null;

  // "Sets" field.
  List<SetsStruct>? _sets;
  List<SetsStruct> get sets => _sets ?? const [];
  set sets(List<SetsStruct>? val) => _sets = val;

  void updateSets(Function(List<SetsStruct>) updateFn) {
    updateFn(_sets ??= []);
  }

  bool hasSets() => _sets != null;

  // "StartTime" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "EndTime" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "ElapsedTime" field.
  String? _elapsedTime;
  String get elapsedTime => _elapsedTime ?? '';
  set elapsedTime(String? val) => _elapsedTime = val;

  bool hasElapsedTime() => _elapsedTime != null;

  // "RestTime" field.
  String? _restTime;
  String get restTime => _restTime ?? '';
  set restTime(String? val) => _restTime = val;

  bool hasRestTime() => _restTime != null;

  static WorkoutStruct fromMap(Map<String, dynamic> data) => WorkoutStruct(
        exercise: data['Exercise'] as String?,
        weightAmount: data['WeightAmount'] as String?,
        sets: getStructList(
          data['Sets'],
          SetsStruct.fromMap,
        ),
        startTime: data['StartTime'] as String?,
        endTime: data['EndTime'] as String?,
        elapsedTime: data['ElapsedTime'] as String?,
        restTime: data['RestTime'] as String?,
      );

  static WorkoutStruct? maybeFromMap(dynamic data) =>
      data is Map ? WorkoutStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Exercise': _exercise,
        'WeightAmount': _weightAmount,
        'Sets': _sets?.map((e) => e.toMap()).toList(),
        'StartTime': _startTime,
        'EndTime': _endTime,
        'ElapsedTime': _elapsedTime,
        'RestTime': _restTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Exercise': serializeParam(
          _exercise,
          ParamType.String,
        ),
        'WeightAmount': serializeParam(
          _weightAmount,
          ParamType.String,
        ),
        'Sets': serializeParam(
          _sets,
          ParamType.DataStruct,
          isList: true,
        ),
        'StartTime': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'EndTime': serializeParam(
          _endTime,
          ParamType.String,
        ),
        'ElapsedTime': serializeParam(
          _elapsedTime,
          ParamType.String,
        ),
        'RestTime': serializeParam(
          _restTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static WorkoutStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkoutStruct(
        exercise: deserializeParam(
          data['Exercise'],
          ParamType.String,
          false,
        ),
        weightAmount: deserializeParam(
          data['WeightAmount'],
          ParamType.String,
          false,
        ),
        sets: deserializeStructParam<SetsStruct>(
          data['Sets'],
          ParamType.DataStruct,
          true,
          structBuilder: SetsStruct.fromSerializableMap,
        ),
        startTime: deserializeParam(
          data['StartTime'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['EndTime'],
          ParamType.String,
          false,
        ),
        elapsedTime: deserializeParam(
          data['ElapsedTime'],
          ParamType.String,
          false,
        ),
        restTime: deserializeParam(
          data['RestTime'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WorkoutStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WorkoutStruct &&
        exercise == other.exercise &&
        weightAmount == other.weightAmount &&
        listEquality.equals(sets, other.sets) &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        elapsedTime == other.elapsedTime &&
        restTime == other.restTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        exercise,
        weightAmount,
        sets,
        startTime,
        endTime,
        elapsedTime,
        restTime
      ]);
}

WorkoutStruct createWorkoutStruct({
  String? exercise,
  String? weightAmount,
  String? startTime,
  String? endTime,
  String? elapsedTime,
  String? restTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkoutStruct(
      exercise: exercise,
      weightAmount: weightAmount,
      startTime: startTime,
      endTime: endTime,
      elapsedTime: elapsedTime,
      restTime: restTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkoutStruct? updateWorkoutStruct(
  WorkoutStruct? workout, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workout
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkoutStructData(
  Map<String, dynamic> firestoreData,
  WorkoutStruct? workout,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workout == null) {
    return;
  }
  if (workout.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workout.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workoutData = getWorkoutFirestoreData(workout, forFieldValue);
  final nestedData = workoutData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workout.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkoutFirestoreData(
  WorkoutStruct? workout, [
  bool forFieldValue = false,
]) {
  if (workout == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workout.toMap());

  // Add any Firestore field values
  workout.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkoutListFirestoreData(
  List<WorkoutStruct>? workouts,
) =>
    workouts?.map((e) => getWorkoutFirestoreData(e, true)).toList() ?? [];
