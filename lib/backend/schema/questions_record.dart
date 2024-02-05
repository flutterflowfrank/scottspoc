import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "question" field.
  QuestionStruct? _question;
  QuestionStruct get question => _question ?? QuestionStruct();
  bool hasQuestion() => _question != null;

  void _initializeFields() {
    _question = QuestionStruct.maybeFromMap(snapshotData['question']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questions');

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  QuestionStruct? question,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': QuestionStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "question" field.
  addQuestionStructData(firestoreData, question, 'question');

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    return e1?.question == e2?.question;
  }

  @override
  int hash(QuestionsRecord? e) => const ListEquality().hash([e?.question]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
