import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HabitsRecord extends FirestoreRecord {
  HabitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "HabitsCounter" field.
  int? _habitsCounter;
  int get habitsCounter => _habitsCounter ?? 0;
  bool hasHabitsCounter() => _habitsCounter != null;

  // "UserID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "LastCompleted" field.
  int? _lastCompleted;
  int get lastCompleted => _lastCompleted ?? 0;
  bool hasLastCompleted() => _lastCompleted != null;

  void _initializeFields() {
    _habitsCounter = castToType<int>(snapshotData['HabitsCounter']);
    _userID = snapshotData['UserID'] as String?;
    _lastCompleted = castToType<int>(snapshotData['LastCompleted']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Habits');

  static Stream<HabitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HabitsRecord.fromSnapshot(s));

  static Future<HabitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HabitsRecord.fromSnapshot(s));

  static HabitsRecord fromSnapshot(DocumentSnapshot snapshot) => HabitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HabitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HabitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HabitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HabitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHabitsRecordData({
  int? habitsCounter,
  String? userID,
  int? lastCompleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'HabitsCounter': habitsCounter,
      'UserID': userID,
      'LastCompleted': lastCompleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class HabitsRecordDocumentEquality implements Equality<HabitsRecord> {
  const HabitsRecordDocumentEquality();

  @override
  bool equals(HabitsRecord? e1, HabitsRecord? e2) {
    return e1?.habitsCounter == e2?.habitsCounter &&
        e1?.userID == e2?.userID &&
        e1?.lastCompleted == e2?.lastCompleted;
  }

  @override
  int hash(HabitsRecord? e) => const ListEquality()
      .hash([e?.habitsCounter, e?.userID, e?.lastCompleted]);

  @override
  bool isValidKey(Object? o) => o is HabitsRecord;
}
