import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class StartupChecklistsRecord extends FirestoreRecord {
  StartupChecklistsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "startup_checklist" field.
  StartupChecklistStruct? _startupChecklist;
  StartupChecklistStruct get startupChecklist =>
      _startupChecklist ?? StartupChecklistStruct();
  bool hasStartupChecklist() => _startupChecklist != null;

  void _initializeFields() {
    _startupChecklist =
        StartupChecklistStruct.maybeFromMap(snapshotData['startup_checklist']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('startup_checklists');

  static Stream<StartupChecklistsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StartupChecklistsRecord.fromSnapshot(s));

  static Future<StartupChecklistsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => StartupChecklistsRecord.fromSnapshot(s));

  static StartupChecklistsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StartupChecklistsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StartupChecklistsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StartupChecklistsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StartupChecklistsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StartupChecklistsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStartupChecklistsRecordData({
  StartupChecklistStruct? startupChecklist,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'startup_checklist': StartupChecklistStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "startup_checklist" field.
  addStartupChecklistStructData(
      firestoreData, startupChecklist, 'startup_checklist');

  return firestoreData;
}

class StartupChecklistsRecordDocumentEquality
    implements Equality<StartupChecklistsRecord> {
  const StartupChecklistsRecordDocumentEquality();

  @override
  bool equals(StartupChecklistsRecord? e1, StartupChecklistsRecord? e2) {
    return e1?.startupChecklist == e2?.startupChecklist;
  }

  @override
  int hash(StartupChecklistsRecord? e) =>
      const ListEquality().hash([e?.startupChecklist]);

  @override
  bool isValidKey(Object? o) => o is StartupChecklistsRecord;
}
