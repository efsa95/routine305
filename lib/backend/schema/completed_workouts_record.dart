import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompletedWorkoutsRecord extends FirestoreRecord {
  CompletedWorkoutsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "exerciseName" field.
  String? _exerciseName;
  String get exerciseName => _exerciseName ?? '';
  bool hasExerciseName() => _exerciseName != null;

  // "completedReps" field.
  int? _completedReps;
  int get completedReps => _completedReps ?? 0;
  bool hasCompletedReps() => _completedReps != null;

  // "completedWeight" field.
  int? _completedWeight;
  int get completedWeight => _completedWeight ?? 0;
  bool hasCompletedWeight() => _completedWeight != null;

  // "dateOfWorkout" field.
  DateTime? _dateOfWorkout;
  DateTime? get dateOfWorkout => _dateOfWorkout;
  bool hasDateOfWorkout() => _dateOfWorkout != null;

  // "currentDay" field.
  String? _currentDay;
  String get currentDay => _currentDay ?? '';
  bool hasCurrentDay() => _currentDay != null;

  // "currentWeek" field.
  String? _currentWeek;
  String get currentWeek => _currentWeek ?? '';
  bool hasCurrentWeek() => _currentWeek != null;

  // "currentMonth" field.
  String? _currentMonth;
  String get currentMonth => _currentMonth ?? '';
  bool hasCurrentMonth() => _currentMonth != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _exerciseName = snapshotData['exerciseName'] as String?;
    _completedReps = castToType<int>(snapshotData['completedReps']);
    _completedWeight = castToType<int>(snapshotData['completedWeight']);
    _dateOfWorkout = snapshotData['dateOfWorkout'] as DateTime?;
    _currentDay = snapshotData['currentDay'] as String?;
    _currentWeek = snapshotData['currentWeek'] as String?;
    _currentMonth = snapshotData['currentMonth'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CompletedWorkouts');

  static Stream<CompletedWorkoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompletedWorkoutsRecord.fromSnapshot(s));

  static Future<CompletedWorkoutsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CompletedWorkoutsRecord.fromSnapshot(s));

  static CompletedWorkoutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompletedWorkoutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompletedWorkoutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompletedWorkoutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompletedWorkoutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompletedWorkoutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompletedWorkoutsRecordData({
  DocumentReference? user,
  String? exerciseName,
  int? completedReps,
  int? completedWeight,
  DateTime? dateOfWorkout,
  String? currentDay,
  String? currentWeek,
  String? currentMonth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'exerciseName': exerciseName,
      'completedReps': completedReps,
      'completedWeight': completedWeight,
      'dateOfWorkout': dateOfWorkout,
      'currentDay': currentDay,
      'currentWeek': currentWeek,
      'currentMonth': currentMonth,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompletedWorkoutsRecordDocumentEquality
    implements Equality<CompletedWorkoutsRecord> {
  const CompletedWorkoutsRecordDocumentEquality();

  @override
  bool equals(CompletedWorkoutsRecord? e1, CompletedWorkoutsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.exerciseName == e2?.exerciseName &&
        e1?.completedReps == e2?.completedReps &&
        e1?.completedWeight == e2?.completedWeight &&
        e1?.dateOfWorkout == e2?.dateOfWorkout &&
        e1?.currentDay == e2?.currentDay &&
        e1?.currentWeek == e2?.currentWeek &&
        e1?.currentMonth == e2?.currentMonth;
  }

  @override
  int hash(CompletedWorkoutsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.exerciseName,
        e?.completedReps,
        e?.completedWeight,
        e?.dateOfWorkout,
        e?.currentDay,
        e?.currentWeek,
        e?.currentMonth
      ]);

  @override
  bool isValidKey(Object? o) => o is CompletedWorkoutsRecord;
}
