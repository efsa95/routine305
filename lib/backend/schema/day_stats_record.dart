import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DayStatsRecord extends FirestoreRecord {
  DayStatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "numberOfWorkouts" field.
  int? _numberOfWorkouts;
  int get numberOfWorkouts => _numberOfWorkouts ?? 0;
  bool hasNumberOfWorkouts() => _numberOfWorkouts != null;

  // "dailyCompleteWorkouts" field.
  List<String>? _dailyCompleteWorkouts;
  List<String> get dailyCompleteWorkouts => _dailyCompleteWorkouts ?? const [];
  bool hasDailyCompleteWorkouts() => _dailyCompleteWorkouts != null;

  // "totalWorkoutDuration" field.
  int? _totalWorkoutDuration;
  int get totalWorkoutDuration => _totalWorkoutDuration ?? 0;
  bool hasTotalWorkoutDuration() => _totalWorkoutDuration != null;

  // "monthForStat" field.
  String? _monthForStat;
  String get monthForStat => _monthForStat ?? '';
  bool hasMonthForStat() => _monthForStat != null;

  // "dayOfMonthForStat" field.
  String? _dayOfMonthForStat;
  String get dayOfMonthForStat => _dayOfMonthForStat ?? '';
  bool hasDayOfMonthForStat() => _dayOfMonthForStat != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _numberOfWorkouts = castToType<int>(snapshotData['numberOfWorkouts']);
    _dailyCompleteWorkouts = getDataList(snapshotData['dailyCompleteWorkouts']);
    _totalWorkoutDuration =
        castToType<int>(snapshotData['totalWorkoutDuration']);
    _monthForStat = snapshotData['monthForStat'] as String?;
    _dayOfMonthForStat = snapshotData['dayOfMonthForStat'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dayStats');

  static Stream<DayStatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DayStatsRecord.fromSnapshot(s));

  static Future<DayStatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DayStatsRecord.fromSnapshot(s));

  static DayStatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DayStatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DayStatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DayStatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DayStatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DayStatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDayStatsRecordData({
  DocumentReference? user,
  int? numberOfWorkouts,
  int? totalWorkoutDuration,
  String? monthForStat,
  String? dayOfMonthForStat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'numberOfWorkouts': numberOfWorkouts,
      'totalWorkoutDuration': totalWorkoutDuration,
      'monthForStat': monthForStat,
      'dayOfMonthForStat': dayOfMonthForStat,
    }.withoutNulls,
  );

  return firestoreData;
}

class DayStatsRecordDocumentEquality implements Equality<DayStatsRecord> {
  const DayStatsRecordDocumentEquality();

  @override
  bool equals(DayStatsRecord? e1, DayStatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.numberOfWorkouts == e2?.numberOfWorkouts &&
        listEquality.equals(
            e1?.dailyCompleteWorkouts, e2?.dailyCompleteWorkouts) &&
        e1?.totalWorkoutDuration == e2?.totalWorkoutDuration &&
        e1?.monthForStat == e2?.monthForStat &&
        e1?.dayOfMonthForStat == e2?.dayOfMonthForStat;
  }

  @override
  int hash(DayStatsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.numberOfWorkouts,
        e?.dailyCompleteWorkouts,
        e?.totalWorkoutDuration,
        e?.monthForStat,
        e?.dayOfMonthForStat
      ]);

  @override
  bool isValidKey(Object? o) => o is DayStatsRecord;
}
