import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentWorkoutRecord extends FirestoreRecord {
  CurrentWorkoutRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  bool hasReps() => _reps != null;

  // "weightAmount" field.
  int? _weightAmount;
  int get weightAmount => _weightAmount ?? 0;
  bool hasWeightAmount() => _weightAmount != null;

  // "workoutName" field.
  String? _workoutName;
  String get workoutName => _workoutName ?? '';
  bool hasWorkoutName() => _workoutName != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _reps = castToType<int>(snapshotData['reps']);
    _weightAmount = castToType<int>(snapshotData['weightAmount']);
    _workoutName = snapshotData['workoutName'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CurrentWorkout');

  static Stream<CurrentWorkoutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CurrentWorkoutRecord.fromSnapshot(s));

  static Future<CurrentWorkoutRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CurrentWorkoutRecord.fromSnapshot(s));

  static CurrentWorkoutRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CurrentWorkoutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CurrentWorkoutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CurrentWorkoutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CurrentWorkoutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CurrentWorkoutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCurrentWorkoutRecordData({
  int? reps,
  int? weightAmount,
  String? workoutName,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reps': reps,
      'weightAmount': weightAmount,
      'workoutName': workoutName,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class CurrentWorkoutRecordDocumentEquality
    implements Equality<CurrentWorkoutRecord> {
  const CurrentWorkoutRecordDocumentEquality();

  @override
  bool equals(CurrentWorkoutRecord? e1, CurrentWorkoutRecord? e2) {
    return e1?.reps == e2?.reps &&
        e1?.weightAmount == e2?.weightAmount &&
        e1?.workoutName == e2?.workoutName &&
        e1?.user == e2?.user;
  }

  @override
  int hash(CurrentWorkoutRecord? e) => const ListEquality()
      .hash([e?.reps, e?.weightAmount, e?.workoutName, e?.user]);

  @override
  bool isValidKey(Object? o) => o is CurrentWorkoutRecord;
}
