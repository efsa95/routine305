import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutsRecord extends FirestoreRecord {
  WorkoutsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "restTime" field.
  DateTime? _restTime;
  DateTime? get restTime => _restTime;
  bool hasRestTime() => _restTime != null;

  // "workoutName" field.
  String? _workoutName;
  String get workoutName => _workoutName ?? '';
  bool hasWorkoutName() => _workoutName != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "exercises" field.
  List<DocumentReference>? _exercises;
  List<DocumentReference> get exercises => _exercises ?? const [];
  bool hasExercises() => _exercises != null;

  void _initializeFields() {
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _restTime = snapshotData['restTime'] as DateTime?;
    _workoutName = snapshotData['workoutName'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _created = snapshotData['created'] as DateTime?;
    _exercises = getDataList(snapshotData['exercises']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workouts');

  static Stream<WorkoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutsRecord.fromSnapshot(s));

  static Future<WorkoutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkoutsRecord.fromSnapshot(s));

  static WorkoutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkoutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkoutsRecordData({
  DateTime? startTime,
  DateTime? endTime,
  DateTime? restTime,
  String? workoutName,
  DocumentReference? user,
  DateTime? created,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'startTime': startTime,
      'endTime': endTime,
      'restTime': restTime,
      'workoutName': workoutName,
      'user': user,
      'created': created,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkoutsRecordDocumentEquality implements Equality<WorkoutsRecord> {
  const WorkoutsRecordDocumentEquality();

  @override
  bool equals(WorkoutsRecord? e1, WorkoutsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.restTime == e2?.restTime &&
        e1?.workoutName == e2?.workoutName &&
        e1?.user == e2?.user &&
        e1?.created == e2?.created &&
        listEquality.equals(e1?.exercises, e2?.exercises);
  }

  @override
  int hash(WorkoutsRecord? e) => const ListEquality().hash([
        e?.startTime,
        e?.endTime,
        e?.restTime,
        e?.workoutName,
        e?.user,
        e?.created,
        e?.exercises
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkoutsRecord;
}
