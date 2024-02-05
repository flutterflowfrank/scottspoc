import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MipChecksRecord extends FirestoreRecord {
  MipChecksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "mip_check" field.
  MIPCheckStruct? _mipCheck;
  MIPCheckStruct get mipCheck => _mipCheck ?? MIPCheckStruct();
  bool hasMipCheck() => _mipCheck != null;

  void _initializeFields() {
    _mipCheck = MIPCheckStruct.maybeFromMap(snapshotData['mip_check']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mip_checks');

  static Stream<MipChecksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MipChecksRecord.fromSnapshot(s));

  static Future<MipChecksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MipChecksRecord.fromSnapshot(s));

  static MipChecksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MipChecksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MipChecksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MipChecksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MipChecksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MipChecksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMipChecksRecordData({
  MIPCheckStruct? mipCheck,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mip_check': MIPCheckStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "mip_check" field.
  addMIPCheckStructData(firestoreData, mipCheck, 'mip_check');

  return firestoreData;
}

class MipChecksRecordDocumentEquality implements Equality<MipChecksRecord> {
  const MipChecksRecordDocumentEquality();

  @override
  bool equals(MipChecksRecord? e1, MipChecksRecord? e2) {
    return e1?.mipCheck == e2?.mipCheck;
  }

  @override
  int hash(MipChecksRecord? e) => const ListEquality().hash([e?.mipCheck]);

  @override
  bool isValidKey(Object? o) => o is MipChecksRecord;
}
