import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompletedRunsRecord extends FirestoreRecord {
  CompletedRunsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "durationSeconds" field.
  int? _durationSeconds;
  int get durationSeconds => _durationSeconds ?? 0;
  bool hasDurationSeconds() => _durationSeconds != null;

  // "distanceMiles" field.
  double? _distanceMiles;
  double get distanceMiles => _distanceMiles ?? 0.0;
  bool hasDistanceMiles() => _distanceMiles != null;

  // "routePoints" field.
  List<LatLng>? _routePoints;
  List<LatLng> get routePoints => _routePoints ?? const [];
  bool hasRoutePoints() => _routePoints != null;

  // "dateOfRun" field.
  DateTime? _dateOfRun;
  DateTime? get dateOfRun => _dateOfRun;
  bool hasDateOfRun() => _dateOfRun != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "avgPace" field.
  String? _avgPace;
  String get avgPace => _avgPace ?? '';
  bool hasAvgPace() => _avgPace != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _durationSeconds = castToType<int>(snapshotData['durationSeconds']);
    _distanceMiles = castToType<double>(snapshotData['distanceMiles']);
    _routePoints = getDataList(snapshotData['routePoints']);
    _dateOfRun = snapshotData['dateOfRun'] as DateTime?;
    _notes = snapshotData['notes'] as String?;
    _avgPace = snapshotData['avgPace'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('completedRuns');

  static Stream<CompletedRunsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompletedRunsRecord.fromSnapshot(s));

  static Future<CompletedRunsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompletedRunsRecord.fromSnapshot(s));

  static CompletedRunsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompletedRunsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompletedRunsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompletedRunsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompletedRunsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompletedRunsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompletedRunsRecordData({
  DocumentReference? user,
  DateTime? startTime,
  DateTime? endTime,
  int? durationSeconds,
  double? distanceMiles,
  DateTime? dateOfRun,
  String? notes,
  String? avgPace,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'startTime': startTime,
      'endTime': endTime,
      'durationSeconds': durationSeconds,
      'distanceMiles': distanceMiles,
      'dateOfRun': dateOfRun,
      'notes': notes,
      'avgPace': avgPace,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompletedRunsRecordDocumentEquality
    implements Equality<CompletedRunsRecord> {
  const CompletedRunsRecordDocumentEquality();

  @override
  bool equals(CompletedRunsRecord? e1, CompletedRunsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.durationSeconds == e2?.durationSeconds &&
        e1?.distanceMiles == e2?.distanceMiles &&
        listEquality.equals(e1?.routePoints, e2?.routePoints) &&
        e1?.dateOfRun == e2?.dateOfRun &&
        e1?.notes == e2?.notes &&
        e1?.avgPace == e2?.avgPace;
  }

  @override
  int hash(CompletedRunsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.startTime,
        e?.endTime,
        e?.durationSeconds,
        e?.distanceMiles,
        e?.routePoints,
        e?.dateOfRun,
        e?.notes,
        e?.avgPace
      ]);

  @override
  bool isValidKey(Object? o) => o is CompletedRunsRecord;
}
