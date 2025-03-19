// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SetsStruct extends FFFirebaseStruct {
  SetsStruct({
    int? desiredReps,
    int? reps,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _desiredReps = desiredReps,
        _reps = reps,
        super(firestoreUtilData);

  // "DesiredReps" field.
  int? _desiredReps;
  int get desiredReps => _desiredReps ?? 0;
  set desiredReps(int? val) => _desiredReps = val;

  void incrementDesiredReps(int amount) => desiredReps = desiredReps + amount;

  bool hasDesiredReps() => _desiredReps != null;

  // "Reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  set reps(int? val) => _reps = val;

  void incrementReps(int amount) => reps = reps + amount;

  bool hasReps() => _reps != null;

  static SetsStruct fromMap(Map<String, dynamic> data) => SetsStruct(
        desiredReps: castToType<int>(data['DesiredReps']),
        reps: castToType<int>(data['Reps']),
      );

  static SetsStruct? maybeFromMap(dynamic data) =>
      data is Map ? SetsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'DesiredReps': _desiredReps,
        'Reps': _reps,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'DesiredReps': serializeParam(
          _desiredReps,
          ParamType.int,
        ),
        'Reps': serializeParam(
          _reps,
          ParamType.int,
        ),
      }.withoutNulls;

  static SetsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SetsStruct(
        desiredReps: deserializeParam(
          data['DesiredReps'],
          ParamType.int,
          false,
        ),
        reps: deserializeParam(
          data['Reps'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SetsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SetsStruct &&
        desiredReps == other.desiredReps &&
        reps == other.reps;
  }

  @override
  int get hashCode => const ListEquality().hash([desiredReps, reps]);
}

SetsStruct createSetsStruct({
  int? desiredReps,
  int? reps,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SetsStruct(
      desiredReps: desiredReps,
      reps: reps,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SetsStruct? updateSetsStruct(
  SetsStruct? sets, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sets
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSetsStructData(
  Map<String, dynamic> firestoreData,
  SetsStruct? sets,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sets == null) {
    return;
  }
  if (sets.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && sets.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final setsData = getSetsFirestoreData(sets, forFieldValue);
  final nestedData = setsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sets.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSetsFirestoreData(
  SetsStruct? sets, [
  bool forFieldValue = false,
]) {
  if (sets == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sets.toMap());

  // Add any Firestore field values
  sets.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSetsListFirestoreData(
  List<SetsStruct>? setss,
) =>
    setss?.map((e) => getSetsFirestoreData(e, true)).toList() ?? [];
