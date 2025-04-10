import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExercisesRecord extends FirestoreRecord {
  ExercisesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "exerciseName" field.
  String? _exerciseName;
  String get exerciseName => _exerciseName ?? '';
  bool hasExerciseName() => _exerciseName != null;

  // "workoutName" field.
  DocumentReference? _workoutName;
  DocumentReference? get workoutName => _workoutName;
  bool hasWorkoutName() => _workoutName != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "desired_reps" field.
  int? _desiredReps;
  int get desiredReps => _desiredReps ?? 0;
  bool hasDesiredReps() => _desiredReps != null;

  // "sets" field.
  int? _sets;
  int get sets => _sets ?? 0;
  bool hasSets() => _sets != null;

  // "getWorkoutName" field.
  String? _getWorkoutName;
  String get getWorkoutName => _getWorkoutName ?? '';
  bool hasGetWorkoutName() => _getWorkoutName != null;

  void _initializeFields() {
    _exerciseName = snapshotData['exerciseName'] as String?;
    _workoutName = snapshotData['workoutName'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _desiredReps = castToType<int>(snapshotData['desired_reps']);
    _sets = castToType<int>(snapshotData['sets']);
    _getWorkoutName = snapshotData['getWorkoutName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exercises');

  static Stream<ExercisesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExercisesRecord.fromSnapshot(s));

  static Future<ExercisesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExercisesRecord.fromSnapshot(s));

  static ExercisesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExercisesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExercisesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExercisesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExercisesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExercisesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExercisesRecordData({
  String? exerciseName,
  DocumentReference? workoutName,
  DocumentReference? user,
  int? desiredReps,
  int? sets,
  String? getWorkoutName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'exerciseName': exerciseName,
      'workoutName': workoutName,
      'user': user,
      'desired_reps': desiredReps,
      'sets': sets,
      'getWorkoutName': getWorkoutName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExercisesRecordDocumentEquality implements Equality<ExercisesRecord> {
  const ExercisesRecordDocumentEquality();

  @override
  bool equals(ExercisesRecord? e1, ExercisesRecord? e2) {
    return e1?.exerciseName == e2?.exerciseName &&
        e1?.workoutName == e2?.workoutName &&
        e1?.user == e2?.user &&
        e1?.desiredReps == e2?.desiredReps &&
        e1?.sets == e2?.sets &&
        e1?.getWorkoutName == e2?.getWorkoutName;
  }

  @override
  int hash(ExercisesRecord? e) => const ListEquality().hash([
        e?.exerciseName,
        e?.workoutName,
        e?.user,
        e?.desiredReps,
        e?.sets,
        e?.getWorkoutName
      ]);

  @override
  bool isValidKey(Object? o) => o is ExercisesRecord;
}
